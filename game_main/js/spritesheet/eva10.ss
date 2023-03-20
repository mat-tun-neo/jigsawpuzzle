const INIT_PIECE_Y = SCREEN_HEIGHT/2 + 300;     // ピースの初期位置の最下ラインY
const CLICK_COUNT_MSG = "クリック回数："         // クリック回数のタイトル
MODE2_PROBABILITY = 100;                        // 2:キャプチャモードの場合にピースがランダム位置の確率

ASSETS.image["mainwindow"] = "./images/green.jpg" + datestr;

const PIECE = {};
const FRAME = {};
const PIECE_TOTALNUM = 48;                  // ピース数
const OUT_PIXEL = 20/PIECE_TOTALNUM*(-1);   // スクリーン外の判定幅
const PIECE_IMAGE = 'eva10';            // ピースの画像名
let width  = [ 127, 131, 100, 129, 104, 126, 127, 156, 105, 106, 131, 127, 129, 131, 107, 130, 105, 132, 101, 107, 100, 156, 158, 100, 156, 127, 130, 105, 127, 106, 107, 132, 131, 131, 105, 100, 155, 126, 131, 159, 129, 132, 131, 156, 132, 134, 126, 131 ];        // 画像サイズX
let height = [ 134, 131, 104, 131, 127, 129, 156, 105, 102, 156, 100, 132, 104, 127, 132, 107, 130, 107, 132, 107, 130, 104, 133, 156, 130, 105, 107, 107, 132, 129, 130, 155, 157, 127, 105, 129, 126, 126, 155, 157, 102, 130, 102, 157, 161, 134, 131, 126 ];        // 画像サイズY
let x = [ 528.5, 239.5, 60.0, 74.5, 156.0, 529.0, 73.5, 446.0, 156.5, 350.0, 337.5, 73.5, 527.5, 336.5, 446.5, 337.0, 156.5, 337.0, 541.5, 155.5, 542.0, 252.0, 448.0, 542.0, 252.0, 528.5, 433.0, 350.5, 73.5, 447.0, 155.5, 240.0, 362.5, 433.5, 253.5, 542.0, 446.5, 73.0, 264.5, 447.5, 74.5, 168.0, 240.5, 349.0, 170.0, 142.0, 73.0, 239.5 ];              // フレーム画像の表示位置X
let y = [ 433.0, 142.5, 156.0, 530.5, 73.5, 721.5, 641.0, 350.5, 735.0, 640.0, 736.0, 434.0, 640.0, 73.5, 434.0, 155.5, 266.0, 543.5, 335.0, 349.5, 169.0, 350.0, 169.5, 543.0, 628.0, 251.5, 640.5, 349.5, 337.0, 265.5, 654.0, 252.5, 446.5, 722.5, 543.5, 74.5, 73.0, 73.0, 446.5, 543.5, 735.0, 433.0, 61.0, 252.5, 543.5, 169.0, 240.5, 723.0 ];              // フレーム画像の表示位置Y
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