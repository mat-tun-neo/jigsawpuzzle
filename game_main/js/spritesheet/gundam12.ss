const INIT_PIECE_Y = SCREEN_HEIGHT/2 + 300;     // ピースの初期位置の最下ラインY
const CLICK_COUNT_MSG = "クリック回数："         // クリック回数のタイトル
MODE2_PROBABILITY = 100;                        // 2:キャプチャモードの場合にピースがランダム位置の確率

ASSETS.image["mainwindow"] = "./images/green.jpg" + datestr;

const PIECE = {};
const FRAME = {};
const PIECE_TOTALNUM = 48;                  // ピース数
const OUT_PIXEL = 20/PIECE_TOTALNUM*(-1);   // スクリーン外の判定幅
const PIECE_IMAGE = 'gundam12';            // ピースの画像名
let width  = [ 133, 100, 106, 132, 127, 132, 107, 134, 132, 159, 129, 129, 127, 127, 107, 101, 100, 156, 130, 129, 126, 102, 127, 129, 126, 130, 130, 107, 129, 129, 102, 129, 104, 129, 131, 103, 131, 157, 156, 130, 134, 131, 159, 133, 103, 132, 104, 131 ];        // 画像サイズX
let height = [ 126, 129, 133, 102, 132, 133, 130, 161, 103, 127, 102, 134, 129, 131, 103, 101, 131, 130, 159, 132, 156, 132, 106, 100, 103, 103, 102, 129, 101, 158, 132, 127, 107, 131, 133, 158, 132, 106, 159, 130, 156, 134, 156, 103, 129, 130, 132, 129 ];        // 画像サイズY
let x = [ 238.5, 542.0, 252.0, 170.0, 73.5, 143.0, 446.5, 336.0, 143.0, 348.5, 433.5, 362.5, 528.5, 528.5, 349.5, 60.5, 542.0, 446.0, 239.0, 74.5, 73.0, 61.0, 528.5, 142.5, 529.0, 337.0, 337.0, 446.5, 74.5, 527.5, 61.0, 527.5, 446.0, 74.5, 168.5, 155.5, 336.5, 252.5, 350.0, 434.0, 169.0, 434.5, 447.5, 238.5, 252.5, 267.0, 156.0, 240.5 ];              // フレーム画像の表示位置X
let y = [ 73.0, 433.5, 169.5, 735.0, 556.0, 432.5, 142.0, 349.5, 349.5, 722.5, 61.0, 530.0, 721.5, 240.5, 446.5, 60.5, 336.5, 460.0, 348.5, 265.0, 156.0, 362.0, 155.0, 60.0, 640.5, 252.5, 61.0, 721.5, 735.5, 542.0, 459.0, 73.5, 543.5, 652.5, 141.5, 254.0, 628.0, 446.0, 156.5, 627.0, 544.0, 239.0, 349.0, 252.5, 721.5, 531.0, 653.0, 627.5 ];              // フレーム画像の表示位置Y
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