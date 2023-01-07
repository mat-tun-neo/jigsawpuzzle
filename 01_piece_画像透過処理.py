import os, re
import cv2
import numpy as np
import shutil

target_pattern = re.compile("\d{14}\.bmp")
target_root = "./game_main/images/"
dirs = [f for f in os.listdir(target_root) if os.path.isdir(os.path.join(target_root, f))]

for dir in dirs:
    if dir == "old": continue
    target_dir = target_root + dir + "/"
    files = [f for f in os.listdir(target_dir) if os.path.isfile(os.path.join(target_dir, f)) if target_pattern.match(str(f))]
    for count, file in enumerate(files):
        # 元画像の読み込み
        src = cv2.imread(target_dir + file)
        # Point 1: 黒色部分に対応するマスク画像を生成
        mask = np.all(src[:,:,:] == [0, 0, 0], axis=-1)
        # Point 2: 元画像をBGR形式からBGRA形式に変換
        dst = cv2.cvtColor(src, cv2.COLOR_BGR2BGRA)
        # Point3: マスク画像をもとに、黒色部分を透明化
        dst[mask,3] = 0
        # png画像として出力
        target_file = target_dir + "piece" + str(count).zfill(2) + ".png"
        print("透過処理：" + target_file)
        cv2.imwrite(target_file, dst)
        # bmp画像をoldへ移動
        if (not os.path.exists(target_dir + "old")): os.mkdir(target_dir + "old")
        if (os.path.isfile(target_dir + "old/" + file)): os.remove(target_dir + "old/" + file)
        shutil.move(target_dir + file, target_dir + "old")