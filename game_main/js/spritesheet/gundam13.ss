const INIT_PIECE_Y = SCREEN_HEIGHT/2 + 300;     // ピースの初期位置の最下ラインY
const CLICK_COUNT_MSG = "クリック回数："         // クリック回数のタイトル
MODE2_PROBABILITY = 100;                        // 2:キャプチャモードの場合にピースがランダム位置の確率

ASSETS.image["mainwindow"] = "./images/green.jpg" + datestr;

const PIECE = {};
const FRAME = {};
const PIECE_TOTALNUM = 48;                  // ピース数
const OUT_PIXEL = 20/PIECE_TOTALNUM*(-1);   // スクリーン外の判定幅
const PIECE_IMAGE = 'gundam13';            // ピースの画像名
let width  = [ 130, 105, 129, 102, 133, 132, 156, 157, 127, 161, 126, 131, 156, 132, 127, 127, 134, 132, 131, 102, 127, 104, 132, 132, 101, 156, 102, 106, 107, 157, 105, 102, 129, 101, 132, 132, 132, 131, 106, 132, 156, 130, 102, 100, 102, 100, 156, 132 ];        // 画像サイズX
let height = [ 104, 127, 156, 159, 157, 132, 102, 158, 132, 132, 133, 130, 105, 159, 100, 129, 100, 131, 132, 133, 130, 134, 107, 157, 103, 103, 131, 105, 102, 100, 155, 127, 131, 105, 155, 134, 107, 131, 102, 127, 127, 133, 129, 159, 129, 102, 130, 134 ];        // 画像サイズY
let x = [ 143.0, 253.5, 142.5, 61.0, 335.5, 143.0, 349.0, 349.5, 528.5, 252.5, 529.0, 433.5, 447.0, 459.0, 528.5, 73.5, 169.0, 337.0, 240.5, 61.0, 528.5, 156.0, 240.0, 240.0, 60.5, 349.0, 541.0, 447.0, 252.5, 155.5, 447.5, 61.0, 74.5, 60.5, 143.0, 364.0, 362.0, 458.5, 447.0, 461.0, 349.0, 142.0, 61.0, 542.0, 541.0, 542.0, 253.0, 238.0 ];              // フレーム画像の表示位置X
let y = [ 447.0, 722.5, 252.0, 348.5, 252.5, 655.0, 735.0, 542.0, 364.0, 337.0, 654.5, 654.0, 252.5, 544.5, 736.0, 721.5, 736.0, 653.5, 434.0, 529.5, 460.0, 142.0, 640.5, 543.5, 252.5, 446.5, 555.5, 447.5, 61.0, 60.0, 349.5, 73.5, 167.5, 445.5, 543.5, 363.0, 155.5, 167.5, 735.0, 73.5, 73.5, 363.5, 627.5, 156.5, 265.5, 61.0, 142.0, 239.0 ];              // フレーム画像の表示位置Y
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