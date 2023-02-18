const INIT_PIECE_Y = SCREEN_HEIGHT/2 + 300;     // ピースの初期位置の最下ラインY
const CLICK_COUNT_MSG = "クリック回数："         // クリック回数のタイトル
MODE2_PROBABILITY = 100;                        // 2:キャプチャモードの場合にピースがランダム位置の確率

ASSETS.image["mainwindow"] = "./images/green.jpg" + datestr;

const PIECE = {};
const FRAME = {};
const PIECE_TOTALNUM = 48;                  // ピース数
const OUT_PIXEL = 20/PIECE_TOTALNUM*(-1);   // スクリーン外の判定幅
const PIECE_IMAGE = 'lum06';            // ピースの画像名
let width  = [ 131, 134, 100, 159, 132, 102, 131, 131, 132, 101, 102, 107, 132, 129, 103, 132, 127, 127, 100, 134, 107, 127, 100, 100, 102, 102, 107, 156, 157, 105, 131, 105, 157, 159, 132, 131, 157, 132, 127, 101, 127, 131, 129, 132, 158, 132, 159, 131 ];        // 画像サイズX
let height = [ 134, 126, 100, 131, 134, 129, 157, 131, 131, 156, 105, 131, 100, 159, 131, 132, 132, 132, 129, 101, 132, 107, 157, 129, 105, 132, 130, 107, 130, 132, 102, 157, 134, 131, 105, 156, 101, 130, 106, 127, 132, 131, 127, 156, 102, 133, 107, 127 ];        // 画像サイズY
let x = [ 458.5, 460.0, 60.0, 156.5, 168.0, 61.0, 362.5, 239.5, 459.0, 541.5, 541.0, 252.5, 362.0, 74.5, 252.5, 337.0, 73.5, 73.5, 60.0, 142.0, 155.5, 528.5, 542.0, 542.0, 61.0, 541.0, 446.5, 350.0, 155.5, 253.5, 265.5, 350.5, 349.5, 447.5, 434.0, 264.5, 252.5, 170.0, 528.5, 541.5, 73.5, 264.5, 459.5, 168.0, 154.0, 459.0, 348.5, 361.5 ];              // フレーム画像の表示位置X
let y = [ 530.0, 723.0, 736.0, 264.5, 557.0, 265.5, 543.5, 433.5, 627.5, 544.0, 639.5, 143.5, 736.0, 641.5, 239.5, 168.0, 531.0, 170.0, 74.5, 60.5, 459.0, 155.5, 349.5, 721.5, 350.5, 240.0, 433.0, 446.5, 363.0, 653.0, 735.0, 349.5, 654.0, 337.5, 154.5, 544.0, 60.5, 654.0, 446.0, 73.5, 434.0, 337.5, 73.5, 156.0, 735.0, 238.5, 252.5, 73.5 ];              // フレーム画像の表示位置Y
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