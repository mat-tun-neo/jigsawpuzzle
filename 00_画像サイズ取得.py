import os, re
from PIL import Image

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
