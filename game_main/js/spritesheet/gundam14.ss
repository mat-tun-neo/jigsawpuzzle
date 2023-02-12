const INIT_PIECE_Y = SCREEN_HEIGHT/2 + 300;     // ピースの初期位置の最下ラインY
const CLICK_COUNT_MSG = "クリック回数："         // クリック回数のタイトル
MODE2_PROBABILITY = 100;                        // 2:キャプチャモードの場合にピースがランダム位置の確率

ASSETS.image["mainwindow"] = "./images/green.jpg" + datestr;

const PIECE = {};
const FRAME = {};
const PIECE_TOTALNUM = 48;                  // ピース数
const OUT_PIXEL = 20/PIECE_TOTALNUM*(-1);   // スクリーン外の判定幅
const PIECE_IMAGE = 'gundam14';            // ピースの画像名
let width  = [ 132, 105, 102, 102, 103, 158, 105, 100, 132, 132, 157, 159, 130, 132, 132, 157, 100, 102, 127, 129, 158, 157, 134, 106, 132, 127, 126, 100, 129, 100, 103, 134, 134, 105, 102, 107, 100, 157, 106, 134, 130, 102, 127, 159, 161, 155, 130, 131 ];        // 画像サイズX
let height = [ 158, 156, 161, 103, 130, 126, 102, 126, 131, 159, 103, 134, 156, 159, 131, 104, 131, 105, 129, 159, 105, 102, 103, 157, 134, 157, 156, 105, 159, 132, 103, 159, 100, 127, 100, 158, 104, 132, 100, 107, 101, 105, 102, 133, 126, 157, 107, 105 ];        // 画像サイズY
let x = [ 240.0, 349.5, 541.0, 541.0, 349.5, 348.0, 251.5, 542.0, 335.0, 143.0, 349.5, 445.5, 239.0, 141.0, 337.0, 252.5, 542.0, 541.0, 528.5, 74.5, 251.0, 155.5, 266.0, 156.0, 362.0, 528.5, 73.0, 60.0, 74.5, 60.0, 155.5, 239.0, 460.0, 154.5, 61.0, 446.5, 542.0, 446.5, 447.0, 142.0, 363.0, 61.0, 73.5, 445.5, 252.5, 446.5, 169.0, 458.5 ];              // フレーム画像の表示位置X
let y = [ 445.0, 349.0, 252.5, 155.5, 143.0, 723.0, 735.0, 73.0, 627.5, 445.5, 446.5, 142.0, 641.0, 253.5, 240.5, 544.0, 434.5, 639.5, 721.5, 156.5, 348.5, 735.0, 155.5, 640.5, 530.0, 543.5, 640.0, 253.5, 350.5, 531.0, 349.5, 251.5, 60.0, 73.5, 736.0, 542.0, 350.0, 240.0, 736.0, 543.5, 60.5, 447.5, 61.0, 654.5, 73.0, 349.5, 155.5, 445.5 ];              // フレーム画像の表示位置Y
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