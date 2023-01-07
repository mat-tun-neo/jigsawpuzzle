import subprocess
import os, re
import cv2
import numpy as np
import shutil
from PIL import Image

waitspeed = 1
config = open("./config.txt", 'w')
target_pattern_bmp = re.compile("\d{14}\.bmp")
target_pattern_png = re.compile("piece.*\.png")
target_root = "./game_main/images/"
dirs = [f for f in os.listdir(target_root) if os.path.isdir(os.path.join(target_root, f))]

# 画像サイズ取得
def get_image_size(target_dir, files):
    array_w = []
    array_h = []
    for file in files:
        im = Image.open(target_dir + file)
        w, h = im.size
        array_w.append(str(w))
        array_h.append(str(h))
    config.write("let width  = [ " + ", ".join(array_w) + " ];        // 画像サイズX\n")
    config.write("let height = [ " + ", ".join(array_h) + " ];        // 画像サイズY\n")

# 画像位置取得
def get_image_locate(target_dir, files):
    target_img = target_root + dir + ".bmp"
    print(target_img)
    if (os.path.isfile(target_img)):
        array_x = []
        array_y = []
        for file in files:
            img = cv2.imread(target_img)
            template = cv2.imread(target_dir + file)
            mask = cv2.imread(target_dir + file.replace("piece", "mask"), 0)
            w, h, _ = template.shape
            result = cv2.matchTemplate(img, template, cv2.TM_CCORR_NORMED, mask=mask)
            min_val, max_val, min_loc, max_loc = cv2.minMaxLoc(result)
            top_left = max_loc
            bottom_right = (top_left[0] + h, top_left[1] + w)
            print(file + str(cv2.minMaxLoc(result)))
            # 画像位置（画像の中心座標）
            array_x.append(str(top_left[0] + h/2))
            array_y.append(str(top_left[1] + w/2))
            # 画像を表示
            cv2.rectangle(img, top_left, bottom_right, (255, 255, 0), 2)
            cv2.imshow('img', img)
            cv2.waitKey(waitspeed)
        config.write("let x = [ " + ", ".join(array_x) + " ];              // フレーム画像の表示位置X\n")
        config.write("let y = [ " + ", ".join(array_y) + " ];              // フレーム画像の表示位置Y\n")

# 透過処理
def touka_image(src_file, dst_file, target_color):
    # 元画像の読み込み
    src = cv2.imread(src_file)
    # Point 1: 黒色部分に対応するマスク画像を生成
    mask = np.all(src[:,:,:] == target_color, axis=-1)
    # Point 2: 元画像をBGR形式からBGRA形式に変換
    dst = cv2.cvtColor(src, cv2.COLOR_BGR2BGRA)
    # Point3: マスク画像をもとに、黒色部分を透明化
    dst[mask,3] = 0
    # 透過処理
    cv2.imwrite(dst_file, dst)

# piece画像作成（画像透過処理）
def make_piece(target_dir, files):
    for count, file in enumerate(files):
        # piece画像のフルパス
        target_piece_file = target_dir + "piece" + str(count).zfill(2) + ".png"
        # 透過処理
        touka_image(target_dir + file, target_piece_file, [0, 0, 0])
        # bmp画像をoldへ移動
        if (not os.path.exists(target_dir + "old")): os.mkdir(target_dir + "old")
        if (os.path.isfile(target_dir + "old/" + file)): os.remove(target_dir + "old/" + file)
        shutil.move(target_dir + file, target_dir + "old")
        # hint画像作成
        make_hint(target_piece_file)
        # shape画像作成
        make_shape(target_piece_file)

# hint画像作成（nconvert）
def make_hint(target_piece_file):
    # hint画像のフルパス
    target_hint_file = target_piece_file.replace("piece", "hint")
    subprocess.run(
        [
            "nconvert",
            "-sepia", "0",
            "-brightness", "15",
            "-gamma", "1",
            "-o", target_hint_file,
            "-clevel", "6",
            target_piece_file
        ]
    )

# shape画像作成（nconvert + 縁取り + 画像透過処理）
def make_shape(target_piece_file):
    # shape一時画像・マスク画像のフルパス
    target_shape_file_tmp = target_piece_file.replace("piece", "shape").replace(".png", ".bmp")   
    target_mask = target_piece_file.replace("piece", "mask")
    subprocess.run(
        [
            "nconvert",
            "-extract", "3",
            "-out", "bmp",
            "-o", target_shape_file_tmp,
            target_piece_file
        ]
    )
    # マスク処理（背景をピースでマスク）してshape一時画像へ保存
    im_mask = Image.open(target_shape_file_tmp)
    im_1 = Image.open("./PF-Sponge.bmp").resize(im_mask.size)
    im_2 = Image.new(mode=im_1.mode, size=im_1.size, color=0)
    im_dst = Image.composite(im_1, im_2, im_mask)
    im_mask.save(target_mask)
    im_mask.close()
    im_dst.save(target_shape_file_tmp)
    # マスク画像を保存
    
    # 縁取りしてshape一時画像へ保存
    img = cv2.imread(target_shape_file_tmp)
    imgGray = cv2.cvtColor(img, cv2.COLOR_BGR2GRAY)
    ret, thresh = cv2.threshold(imgGray, 0, 1, cv2.THRESH_BINARY)
    contours, hierarchy = cv2.findContours(thresh, cv2.RETR_EXTERNAL, cv2.CHAIN_APPROX_SIMPLE)
    output = cv2.drawContours(img, contours, -1, (69, 69, 71), 2)
    cv2.imwrite(target_shape_file_tmp, output)
    # shape画像のフルパス
    target_shape_file = target_shape_file_tmp.replace(".bmp", ".png")
    # 透過処理
    touka_image(target_shape_file_tmp, target_shape_file, [0, 0, 0])
    # 一時画像を削除
    os.remove(target_shape_file_tmp)

# ピース作成
for dir in dirs:
    if dir == "old": continue
    target_dir = target_root + dir + "/"
    files = [f for f in os.listdir(target_dir) if os.path.isfile(os.path.join(target_dir, f)) if target_pattern_bmp.match(str(f))]
    # piece画像作成
    make_piece(target_dir, files)

# 定義ファイル作成
for dir in dirs:
    if dir == "old": continue
    target_dir = target_root + dir + "/"
    files = [f for f in os.listdir(target_dir) if os.path.isfile(os.path.join(target_dir, f)) if target_pattern_png.match(str(f))]
    # 画像名
    config.write("const PIECE_IMAGE = '" + dir + "';            // ピースの画像名\n")
    # 画像サイズ取得
    get_image_size(target_dir, files)
    # 画像位置取得
    get_image_locate(target_dir, files)
