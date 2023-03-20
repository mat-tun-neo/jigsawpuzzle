const INIT_PIECE_Y = SCREEN_HEIGHT/2 + 300;     // ピースの初期位置の最下ラインY
const CLICK_COUNT_MSG = "クリック回数："         // クリック回数のタイトル
MODE2_PROBABILITY = 100;                        // 2:キャプチャモードの場合にピースがランダム位置の確率

ASSETS.image["mainwindow"] = "./images/green.jpg" + datestr;

const PIECE = {};
const FRAME = {};
const PIECE_TOTALNUM = 48;                  // ピース数
const OUT_PIXEL = 20/PIECE_TOTALNUM*(-1);   // スクリーン外の判定幅
const PIECE_IMAGE = 'eva13';            // ピースの画像名
let width  = [ 104, 127, 130, 107, 101, 156, 105, 156, 130, 102, 131, 156, 127, 129, 105, 101, 129, 131, 132, 105, 159, 127, 132, 102, 126, 132, 157, 105, 107, 107, 131, 130, 130, 100, 155, 134, 130, 102, 157, 102, 126, 130, 130, 131, 102, 161, 129, 126 ];        // 画像サイズX
let height = [ 126, 130, 132, 131, 105, 159, 129, 131, 106, 100, 129, 127, 132, 100, 131, 127, 102, 134, 132, 127, 130, 105, 106, 161, 127, 132, 130, 132, 107, 107, 102, 101, 105, 131, 127, 131, 157, 131, 132, 134, 129, 156, 127, 156, 159, 131, 159, 107 ];        // 画像サイズY
let x = [ 350.0, 528.5, 434.0, 349.5, 541.5, 253.0, 156.5, 155.0, 239.0, 541.0, 239.5, 447.0, 528.5, 74.5, 154.5, 541.5, 265.5, 142.5, 143.0, 156.5, 154.5, 73.5, 362.0, 541.0, 72.0, 265.0, 446.5, 447.5, 349.5, 446.5, 239.5, 168.0, 433.0, 60.0, 446.5, 239.0, 337.0, 61.0, 349.5, 61.0, 73.0, 266.0, 337.0, 458.5, 61.0, 349.5, 527.5, 529.0 ];              // フレーム画像の表示位置X
let y = [ 73.0, 460.0, 558.0, 336.5, 251.5, 639.5, 433.5, 336.5, 446.0, 736.0, 530.5, 722.5, 168.0, 736.0, 240.5, 73.5, 61.0, 627.0, 529.0, 722.5, 143.0, 253.5, 156.0, 349.5, 73.5, 143.0, 362.0, 461.0, 640.5, 155.5, 735.0, 60.5, 641.5, 167.5, 73.5, 239.5, 543.5, 336.5, 240.0, 530.0, 433.5, 350.0, 722.5, 252.0, 641.5, 434.5, 641.5, 543.5 ];              // フレーム画像の表示位置Y
const OFFSET_X = 0;                         // フレーム画像の表示位置 オフセットX
const OFFSET_Y = 0;                         // フレーム画像の表示位置 オフセットY

let animations = { "000" : {"frames": [ 0],  "next": "000", "frequency": 1 } };
for (let i = 0; i < PIECE_TOTALNUM; i++) {
    let no = zeroPadding(i, 2);
    let piece_no = "piece" + no;
    let mode_no = document.getElementById("mode").innerText + no;
    let frame_no = "frame" + no;
    ASSETS.image[piece_no] = "./images/" + PIECE_IMAGE + "/" + piece_no + ".png" + datestr;
    ASSETS.image[frame_no] = "./images/" + PIECE_IMAGE + "/" + mode_no + ".png" + datestr;
    ASSETS.spritesheet[piece_no] = { "frame": {"width": width[i], "height": height[i], "cols": 1, "rows": 1}, "animations": animations };
    ASSETS.spritesheet[frame_no] = { "frame": {"width": width[i], "height": height[i], "cols": 1, "rows": 1}, "animations": animations };
    PIECE[no] = { sheetname: piece_no, width: width[i], height: height[i] };
    FRAME[no] = { sheetname: frame_no, width: width[i], height: height[i], x: x[i], y: y[i] };
}

const GOAL_Y = SCREEN_HEIGHT/2 + 390;           // ゴール画像の位置Y
GOAL_BUTTON_WIDTH      = 400;
GOAL_BUTTON_HEIGHT     = 150;
ASSETS.image["goal_button"] = "./images/complete.png" + datestr;
ASSETS.spritesheet["goal_button"] = { "frame": {"width": 500, "height": 187, "cols": 1, "rows": 1}, "animations": animations };