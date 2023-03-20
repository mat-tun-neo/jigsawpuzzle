const INIT_PIECE_Y = SCREEN_HEIGHT/2 + 300;     // ピースの初期位置の最下ラインY
const CLICK_COUNT_MSG = "クリック回数："         // クリック回数のタイトル
MODE2_PROBABILITY = 100;                        // 2:キャプチャモードの場合にピースがランダム位置の確率

ASSETS.image["mainwindow"] = "./images/green.jpg" + datestr;

const PIECE = {};
const FRAME = {};
const PIECE_TOTALNUM = 48;                  // ピース数
const OUT_PIXEL = 20/PIECE_TOTALNUM*(-1);   // スクリーン外の判定幅
const PIECE_IMAGE = 'eva09';            // ピースの画像名
let width  = [ 106, 105, 107, 158, 102, 131, 126, 102, 105, 102, 127, 156, 101, 105, 107, 157, 131, 104, 157, 105, 156, 100, 156, 105, 134, 126, 102, 159, 131, 157, 133, 107, 159, 126, 156, 127, 102, 127, 130, 104, 131, 133, 127, 129, 127, 104, 159, 129 ];        // 画像サイズX
let height = [ 130, 156, 132, 132, 157, 101, 129, 157, 100, 105, 106, 157, 159, 131, 132, 132, 127, 102, 159, 159, 134, 127, 132, 130, 127, 131, 102, 127, 132, 130, 155, 105, 107, 156, 131, 131, 107, 126, 102, 133, 103, 133, 102, 105, 132, 106, 102, 132 ];        // 画像サイズY
let x = [ 155.0, 253.5, 252.5, 445.0, 541.0, 167.5, 73.0, 61.0, 253.5, 61.0, 528.5, 350.0, 541.5, 446.5, 349.5, 155.5, 167.5, 252.0, 446.5, 253.5, 253.0, 542.0, 349.0, 447.5, 336.0, 529.0, 541.0, 447.5, 336.5, 155.5, 169.5, 446.5, 156.5, 73.0, 349.0, 73.5, 61.0, 73.5, 336.0, 253.0, 264.5, 169.5, 73.5, 527.5, 528.5, 349.0, 445.5, 433.5 ];              // フレーム画像の表示位置X
let y = [ 653.0, 544.0, 335.0, 265.0, 640.5, 735.5, 556.5, 252.5, 736.0, 156.5, 447.0, 446.5, 251.5, 361.5, 653.0, 240.0, 73.5, 61.0, 639.5, 156.5, 654.0, 73.5, 556.0, 530.0, 73.5, 361.5, 735.0, 73.5, 168.0, 336.0, 543.5, 447.5, 155.5, 446.0, 337.5, 653.5, 349.5, 73.0, 735.0, 432.5, 252.5, 432.5, 735.0, 154.5, 531.0, 252.0, 735.0, 168.0 ];              // フレーム画像の表示位置Y
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