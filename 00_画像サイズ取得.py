import os, re
from PIL import Image
import cv2

target_result = "./size.txt"
target_root = "./game_main/images/"
target_pattern = re.compile("piece.*\.png")
dirs = [f for f in os.listdir(target_root) if os.path.isdir(os.path.join(target_root, f))]

res = open(target_result, 'w')
for dir in dirs:
    if dir == "old": continue
    res.write(dir + "\n")
    target_dir = target_root + dir + "/"
    files = [f for f in os.listdir(target_dir) if os.path.isfile(os.path.join(target_dir, f)) if target_pattern.match(str(f))]
    array_w = []
    array_h = []
    for file in files:
        im = Image.open(target_dir + file)
        w, h = im.size
        array_w.append(str(w))
        array_h.append(str(h))
    res.write("let width  = [ " + ", ".join(array_w) + " ];        // 画像サイズX\n")
    res.write("let height = [ " + ", ".join(array_h) + " ];        // 画像サイズY\n")

    for file in files:
        # 被検索画像と検索画像の読み込み
        target_img = target_root + dir + ".bmp"
        if (os.path.isfile(target_img)):
            img = cv2.imread(target_img)
            template = cv2.imread(target_dir + file)
            mask = cv2.imread(target_dir + file.replace("piece", "mask"), 0)
            # テンプレート画像の幅と高さを取得
            w, h, _ = template.shape
            # 画像の検索（Template Matching）
            result = cv2.matchTemplate(img, template, cv2.TM_CCORR_NORMED, mask=mask)
            # 検索結果の信頼度と位置座標の取得
            min_val, max_val, min_loc, max_loc = cv2.minMaxLoc(result)
            print(file + str(cv2.minMaxLoc(result)))
            # 検索結果の左上頂点の座標を取得
            top_left = max_loc
            # 検索結果の右下頂点の座標を取得
            bottom_right = (top_left[0] + h, top_left[1] + w)
            # 中点
            center_point = (top_left[0] + h/2, top_left[1] + w/2)
            #print(file + str(top_left) + str(bottom_right) + " → " + str(center_point))
            # 検索対象画像内に、検索結果を長方形で描画
            cv2.rectangle(img, top_left, bottom_right, (255, 255, 0), 2)
            # 画像を表示
            cv2.imshow('img', img)
            cv2.waitKey(500)