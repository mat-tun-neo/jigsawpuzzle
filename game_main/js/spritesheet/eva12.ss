const INIT_PIECE_Y = SCREEN_HEIGHT/2 + 300;     // ピースの初期位置の最下ラインY
const CLICK_COUNT_MSG = "クリック回数："         // クリック回数のタイトル
MODE2_PROBABILITY = 100;                        // 2:キャプチャモードの場合にピースがランダム位置の確率

ASSETS.image["mainwindow"] = "./images/green.jpg" + datestr;

const PIECE = {};
const FRAME = {};
const PIECE_TOTALNUM = 48;                  // ピース数
const OUT_PIXEL = 20/PIECE_TOTALNUM*(-1);   // スクリーン外の判定幅
const PIECE_IMAGE = 'eva12';            // ピースの画像名
let width  = [ 102, 130, 126, 130, 130, 126, 132, 132, 132, 106, 100, 130, 129, 158, 104, 159, 106, 158, 102, 104, 129, 158, 101, 157, 134, 127, 101, 105, 101, 127, 129, 131, 134, 131, 127, 129, 130, 130, 131, 105, 131, 129, 132, 127, 102, 131, 105, 155 ];        // 画像サイズX
let height = [ 130, 133, 161, 129, 132, 159, 127, 102, 129, 129, 130, 105, 100, 161, 105, 156, 107, 100, 129, 130, 130, 157, 100, 132, 132, 156, 131, 127, 133, 129, 159, 130, 105, 159, 102, 134, 129, 134, 131, 103, 132, 107, 129, 101, 107, 100, 133, 132 ];        // 画像サイズY
let x = [ 541.0, 266.0, 529.0, 169.0, 266.0, 73.0, 434.0, 240.0, 143.0, 155.0, 60.0, 460.0, 527.5, 445.0, 156.0, 350.5, 349.0, 254.0, 541.0, 447.0, 362.5, 154.0, 60.5, 446.5, 169.0, 73.5, 541.5, 350.5, 541.5, 528.5, 74.5, 264.5, 433.0, 239.5, 528.5, 336.5, 336.0, 169.0, 240.5, 350.5, 264.5, 74.5, 432.0, 73.5, 61.0, 143.5, 348.5, 446.5 ];              // フレーム画像の表示位置X
let y = [ 434.0, 141.5, 640.5, 653.5, 337.0, 641.5, 73.5, 735.0, 556.5, 74.5, 336.0, 251.5, 736.0, 349.5, 253.5, 252.0, 155.5, 60.0, 239.5, 627.0, 627.0, 349.5, 736.0, 461.0, 170.0, 156.0, 142.5, 73.5, 335.5, 530.5, 445.5, 654.0, 544.5, 544.5, 61.0, 530.0, 721.5, 460.0, 240.5, 446.5, 434.0, 252.5, 721.5, 60.5, 543.5, 736.0, 363.5, 168.0 ];              // フレーム画像の表示位置Y
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