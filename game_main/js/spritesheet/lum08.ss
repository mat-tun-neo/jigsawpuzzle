const INIT_PIECE_Y = SCREEN_HEIGHT/2 + 300;     // ピースの初期位置の最下ラインY
const CLICK_COUNT_MSG = "クリック回数："         // クリック回数のタイトル
MODE2_PROBABILITY = 100;                        // 2:キャプチャモードの場合にピースがランダム位置の確率

ASSETS.image["mainwindow"] = "./images/green.jpg" + datestr;

const PIECE = {};
const FRAME = {};
const PIECE_TOTALNUM = 48;                  // ピース数
const OUT_PIXEL = 20/PIECE_TOTALNUM*(-1);   // スクリーン外の判定幅
const PIECE_IMAGE = 'lum08';            // ピースの画像名
let width  = [ 131, 126, 127, 102, 103, 106, 127, 102, 155, 132, 131, 129, 129, 130, 130, 132, 127, 131, 130, 126, 126, 157, 134, 107, 106, 100, 106, 159, 131, 157, 159, 130, 130, 129, 102, 107, 101, 130, 157, 102, 102, 134, 126, 105, 132, 131, 105, 157 ];        // 画像サイズX
let height = [ 158, 130, 127, 104, 101, 134, 106, 126, 131, 127, 131, 131, 134, 130, 131, 157, 107, 106, 159, 132, 132, 102, 102, 156, 131, 105, 126, 106, 106, 127, 100, 106, 156, 129, 127, 155, 134, 104, 155, 159, 126, 129, 157, 156, 129, 100, 104, 104 ];        // 画像サイズY
let x = [ 337.5, 73.0, 73.5, 541.0, 349.5, 446.0, 73.5, 541.0, 155.5, 168.0, 264.5, 433.5, 74.5, 363.0, 169.0, 459.0, 528.5, 433.5, 169.0, 529.0, 529.0, 155.5, 266.0, 252.5, 155.0, 60.0, 252.0, 350.5, 239.5, 446.5, 445.5, 240.0, 337.0, 527.5, 541.0, 446.5, 60.5, 460.0, 349.5, 541.0, 61.0, 142.0, 73.0, 253.5, 240.0, 337.5, 156.5, 349.5 ];              // フレーム画像の表示位置X
let y = [ 642.0, 336.0, 73.5, 253.0, 60.5, 142.0, 640.0, 73.0, 167.5, 73.5, 556.5, 361.5, 433.0, 531.0, 555.5, 252.5, 543.5, 641.0, 445.5, 628.0, 170.0, 735.0, 61.0, 446.0, 653.5, 253.5, 723.0, 446.0, 350.0, 722.5, 60.0, 640.0, 350.0, 336.5, 722.5, 543.5, 169.0, 447.0, 155.5, 445.5, 723.0, 265.5, 543.5, 155.0, 265.5, 736.0, 349.0, 253.0 ];              // フレーム画像の表示位置Y
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
