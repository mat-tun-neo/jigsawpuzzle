import os, re

before_str = "_result_piece"
after_str = "hint"
target_pattern = re.compile("_result_piece.*\.png")
target_root = "./game_main/images/"
dirs = [f for f in os.listdir(target_root) if os.path.isdir(os.path.join(target_root, f))]

for dir in dirs:
    if dir == "old": continue
    target_dir = target_root + dir + "/"
    files = [f for f in os.listdir(target_dir) if os.path.isfile(os.path.join(target_dir, f)) if target_pattern.match(str(f))]
    for file in files:
        oldpath = target_dir + file
        newpath = target_dir + file.replace(before_str, after_str)
        print(oldpath + " → " + newpath)
        os.rename(oldpath, newpath)
