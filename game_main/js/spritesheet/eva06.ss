const INIT_PIECE_Y = SCREEN_HEIGHT/2 + 300;     // ピースの初期位置の最下ラインY
const CLICK_COUNT_MSG = "クリック回数："         // クリック回数のタイトル
MODE2_PROBABILITY = 100;                        // 2:キャプチャモードの場合にピースがランダム位置の確率

ASSETS.image["mainwindow"] = "./images/green.jpg" + datestr;

const PIECE = {};
const FRAME = {};
const PIECE_TOTALNUM = 48;                  // ピース数
const OUT_PIXEL = 20/PIECE_TOTALNUM*(-1);   // スクリーン外の判定幅
const PIECE_IMAGE = 'eva06';            // ピースの画像名
let width  = [ 129, 134, 101, 156, 158, 127, 105, 107, 127, 131, 131, 107, 129, 131, 132, 156, 127, 131, 131, 129, 132, 102, 131, 134, 132, 107, 101, 129, 156, 127, 127, 106, 130, 102, 132, 102, 132, 103, 126, 105, 157, 131, 129, 100, 105, 157, 130, 132 ];        // 画像サイズX
let height = [ 157, 127, 134, 129, 107, 105, 102, 134, 132, 132, 129, 157, 102, 127, 129, 127, 127, 105, 132, 159, 100, 107, 130, 105, 134, 104, 157, 127, 132, 105, 130, 159, 129, 132, 106, 131, 157, 130, 134, 131, 132, 155, 127, 101, 100, 158, 134, 105 ];        // 画像サイズY
let x = [ 527.5, 460.0, 60.5, 156.0, 254.0, 528.5, 252.5, 446.5, 73.5, 240.5, 167.5, 349.5, 527.5, 265.5, 337.0, 350.0, 73.5, 142.5, 142.5, 527.5, 432.0, 61.0, 240.5, 363.0, 240.0, 155.5, 60.5, 168.5, 253.0, 73.5, 528.5, 155.0, 433.0, 61.0, 434.0, 541.0, 265.0, 446.5, 529.0, 350.5, 446.5, 433.5, 74.5, 542.0, 348.5, 349.5, 143.0, 337.0 ];              // フレーム画像の表示位置X
let y = [ 640.5, 73.5, 169.0, 336.5, 543.5, 445.5, 61.0, 266.0, 459.0, 628.0, 721.5, 446.5, 735.0, 722.5, 653.5, 73.5, 722.5, 542.5, 626.0, 348.5, 736.0, 640.5, 142.0, 350.5, 239.0, 253.0, 349.5, 73.5, 459.0, 253.5, 239.0, 445.5, 653.5, 556.0, 446.0, 143.5, 349.5, 363.0, 530.0, 555.5, 168.0, 543.5, 73.5, 60.5, 736.0, 251.0, 169.0, 154.5 ];              // フレーム画像の表示位置Y
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