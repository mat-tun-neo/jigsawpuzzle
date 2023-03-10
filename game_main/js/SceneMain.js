/*
 * メインシーン
 */
phina.define("SceneMain", {
  // 継承
  superClass: "DisplayScene",
  // コンストラクタ
  init: function(param) {
    console.log("SceneMainクラスinit");
    // 親クラス初期化
    this.superInit();
    // 背景スプライト
    this.mainwindow = Sprite("mainwindow").addChildTo(this);
    this.mainwindow.setPosition(this.gridX.center(), this.gridY.center());
    // メイン画面設定
    GameMain = this;
    // スプライトグループ
    this.background = DisplayElement().addChildTo(this);
    this.frameGroup = DisplayElement().addChildTo(this);
    this.matchGroup = DisplayElement().addChildTo(this);
    this.pieceGroup = DisplayElement().addChildTo(this);
    this.buttonGroup = DisplayElement().addChildTo(this);
    // Xボタン描画
    this.drawXButton();
    // スタートボタン描画
    this.drawStartButton();
    // 正解数カウント
    this.correct_cnt = 0;
    // クリック数カウント
    this.click_cnt = 0;
    // デバッグ対象のスプライト
    this.debug_sprite_index = 0;
    this.debug_sprite;
  },
  // 画面更新
  update: function(app) {
    // プレイヤー更新
    //if (app.frame % UPDATE_FRAME == 0) {
      //console.log("update_frame：" + app.frame);
    //};
    // spriteの当たり判定
    this.pieceGroup.children.forEach(child => {
      if (!child.matchFlg && child.matchCheck()) {
        //console.log("before:", this.pieceGroup.children);
        // 移動停止
        child.sprite.flickable.vertical = false;
        child.sprite.flickable.horizontal = false;
        child.sprite.setInteractive(false);
        releaseSemaphore();
        // スプライトを奥のグループに移動
        child.addChildTo(this.matchGroup);
        // 正解数インクリメント
        this.correct_cnt++;
        console.log("this.correct_cnt", this.correct_cnt);
        // 全問正解の場合
        if (this.correct_cnt == PIECE_TOTALNUM) {
          this.correct_cnt = 0;
          this.drawGoalButton();
        }
        //console.log("after:", this.pieceGroup.children);
      }
    })

    // デバッグモード(0: OFF, 1: ON, 2: キャプチャモード)
    if (DEBUG_MODE == 1) {
      let key = app.keyboard;
      let target_sprite;
      if (this.debug_sprite == null) {
        this.debug_sprite = phina.display.StarShape().addChildTo(this.buttonGroup);
        let no = zeroPadding(this.debug_sprite_index, 2);
        let f = FRAME[no];
        this.debug_sprite.setPosition(f.x, f.y);
      }
      if (this.frameGroup.children[this.debug_sprite_index] != null) {
        target_sprite = this.frameGroup.children[this.debug_sprite_index].sprite;
        if (key.getKeyDown('space')) {
          let array_x = [];
          let array_y = [];
          this.frameGroup.children.forEach((child, index)=> {
            array_x[index] = child.sprite.x;
            array_y[index] = child.sprite.y;
          })
          console.log("let x = [ " + array_x.join(", ") + " ];              // フレーム画像の表示位置X");
          console.log("let y = [ " + array_y.join(", ") + " ];              // フレーム画像の表示位置Y");
        }
        // キー押下中移動
        if (key.getKey('left')) {
          target_sprite.x--;
        }
        if (key.getKey('right')) {
          target_sprite.x++;
        }
        if (key.getKey('up')) {
          target_sprite.y--;
        }
        if (key.getKey('down')) {
          target_sprite.y++;
        }
        // 0.5ピクセルずつ移動
        if (key.getKeyDown('delete')) {
          target_sprite.x -= 0.5;
        }
        if (key.getKeyDown('pagedown')) {
          target_sprite.x += 0.5;
        }
        if (key.getKeyDown('home')) {
          target_sprite.y -= 0.5;
        }
        if (key.getKeyDown('end')) {
          target_sprite.y += 0.5;
        }
      }
      if (key.getKeyDown('Z')) {
        this.debug_sprite_index--;
        let no = zeroPadding(this.debug_sprite_index, 2);
        let f = FRAME[no];
        this.debug_sprite.setPosition(f.x, f.y);
        console.log("debug_sprite_index:", this.debug_sprite_index);
      }
      if (key.getKeyDown('X')) {
        this.debug_sprite_index++;
        let no = zeroPadding(this.debug_sprite_index, 2);
        let f = FRAME[no];
        this.debug_sprite.setPosition(f.x, f.y);
        console.log("debug_sprite_index:", this.debug_sprite_index);
      }
    }
  },
  // Xボタン描画
  drawXButton: function() {
    //console.log("SceneMainクラスdrawXButton");
    let xbutton = SpriteButtonX(
      "000", SCREEN_WIDTH - BUTTON_SIZE / 2, BUTTON_SIZE / 2
    ).addChildTo(this.background);
    //console.log(this.xbutton.x + "/" + this.xbutton.y);
    // Xボタン押下時の処理
    xbutton.sprite.setInteractive(true);
    xbutton.sprite.onpointstart = function() {
      console.log("xbutton.onpointstart");
      this.exit("Exit");
    }.bind(this);
  },
  // スタートボタン描画
  drawStartButton: function() {
    //console.log("SceneMainクラスdrawStartButton");
    let startbutton = SpriteButtonStart(
      "000", SCREEN_WIDTH / 2, SCREEN_HEIGHT / 2
    ).addChildTo(this.buttonGroup);
    // スタートボタン押下時の処理
    startbutton.sprite.setInteractive(true);
    startbutton.sprite.onpointstart = function() {
      console.log("startButton.onpointstart");
      startbutton.removeSprite();
      // 枠とキャラクターの描画
      this.drawCharactor();
      // フリック数ラベルの描画
      this.titleLabel = Label({text: CLICK_COUNT_MSG + "00"}).addChildTo(this.background);
      this.titleLabel.setPosition(SCREEN_WIDTH/2, LABEL_FONT_SIZE);
      this.titleLabel.fontSize = LABEL_FONT_SIZE;
      this.titleLabel.fill = "white";
      this.titleLabel.stroke = "black";
      this.titleLabel.strokeWidth = 2;
      // 画面全体のクリック判定でカウント
      this.setInteractive(true);
      // デバッグモード(0: OFF, 1: ON, 2: キャプチャモード)
      if (DEBUG_MODE == 2) {
        this.click_cnt = PIECE_TOTALNUM;
      } else {
        this.click_cnt = 0;
      }
      this.onpointstart = () => {
        //console.log("this onpointclick");
        this.titleLabel.text = CLICK_COUNT_MSG + this.click_cnt;
        // デバッグモード(0: OFF, 1: ON, 2: キャプチャモード)
        if (DEBUG_MODE != 2) {
          this.click_cnt++;
        }
      }
    }.bind(this);
  },
  // ゴールボタン描画
  drawGoalButton: function() {
    //console.log("SceneMainクラスdrawGoalStartButton");
    let goalbutton = SpriteButtonGoal(
      "000", SCREEN_WIDTH / 2, GOAL_Y
    ).addChildTo(this.buttonGroup);
    // ゴールボタン押下時の処理
    goalbutton.sprite.setInteractive(true);
    goalbutton.sprite.onpointstart = function() {
      console.log("goalButton.onpointstart");
      goalbutton.removeSprite();
      // 枠とキャラクターの描画
      this.drawCharactor();
      this.click_cnt = 0;
    }.bind(this);
  },
  // 枠とキャラクターの描画
  drawCharactor: function() {
    //console.log("SceneMainクラスdrawCharactor");
    this.frameGroup.children.length = 0;
    this.matchGroup.children.length = 0;
    this.pieceGroup.children.length = 0;

    // 枠の描画
    for (let i = 0; i < PIECE_TOTALNUM; i++) {
      let no = zeroPadding(i, 2);
      let f = FRAME[no];
      let obj = SpriteCharacter(
        f.sheetname, "000", f.x + OFFSET_X, f.y + OFFSET_Y, -1, f.width, f.height
      ).addChildTo(this.frameGroup);
      // デバッグモード(0: OFF, 1: ON, 2: キャプチャモード)
      if (DEBUG_MODE == 1) {
        obj.sprite.setInteractive(true);
        obj.sprite.onpointmove = (e) => {
          obj.sprite.x += Math.round(e.pointer.dx);
          obj.sprite.y += Math.round(e.pointer.dy);
        };
      }
    }
    // ピースの描画
    let index = 0;
    for (let i = 0; i < PIECE_TOTALNUM; i++) {
      let no = zeroPadding(i, 2);
      let p = PIECE[no];
      let obj = SpriteCharacter(
        p.sheetname, "000", 0, 0, index, p.width, p.height
      ).addChildTo(this.pieceGroup);
      // デバッグモード(0: OFF, 1: ON, 2: キャプチャモード)
      if (DEBUG_MODE == 2) {
        let f = FRAME[no];
        if (rand(0,99) > MODE2_PROBABILITY) {
          obj.moveRandom();
        } else {
          obj.sprite.x = Math.round(f.x) + OFFSET_X;
          obj.sprite.y = Math.round(f.y) + OFFSET_Y;
        }
      } else {
        obj.moveRandom();
      }

      // マウス・指のイベント処理（キャラクターのみ）
      listSemaphore[index] = 0;
      let sprite = obj.sprite;
      let flick = sprite.flickable;
      sprite.setInteractive(true);

      // オブジェクト上でマウスボタンを押下、もしくは指でオブジェクトをタッチした瞬間
      sprite.onpointstart = () => {
        //console.log("obj.index onpointclick", obj.index);
        getSemaphore(obj);
        // レイヤーが一番手前のsprite
        if (listSemaphore[obj.index] == 1) {
          console.log("obj.index splice", obj.index);
          // グループの一番手前に移動
          this.pieceGroup.children.splice(obj.index, 1);
          obj.addChildTo(this.pieceGroup);
          // 摩擦係数（デフォルト0.9）
          flick.friction = 0.9;
          obj.fixed_x = -1;
          obj.fixed_y = -1;
          // spriteのindexを更新
          this.pieceGroup.children.forEach((child, index)=> {
            child.index = index;
          })
          // 一番手前のsprite以外は動かないようにする
          this.pieceGroup.children
          .filter(child => child.index != this.pieceGroup.children.length - 1)
          .forEach((child, index)=> {
            child.sprite.flickable.friction = 0;
            child.fixed_x = child.sprite.x;
            child.fixed_y = child.sprite.y;
          })
        }
      };

      // pointstart後、マウスボタンを押下しつづける、もくしは指を端末上においている間
      // （マウスボタン/指を押さえている間はオブジェクトの範囲外に出ても発火し続ける）
      sprite.onpointstay = (e) => {
        //console.log("obj.index onpointstay", obj.index);
      };

      // pointstayの状態でマウスポインタ、もくしは指を移動
      // （pointstay同様、オブジェクト範囲外に出ても発火し続ける）
      sprite.onpointmove = () => {
        //console.log("obj.index onpointmove", obj.index);
        getSemaphore(obj);
        // スクリーン外へ移動した場合
        if (sprite.y < OUT_PIXEL)                 sprite.y = OUT_PIXEL;
        if (sprite.y > SCREEN_HEIGHT - OUT_PIXEL) sprite.y = SCREEN_HEIGHT - OUT_PIXEL;
        if (sprite.x < OUT_PIXEL)                 sprite.x = OUT_PIXEL;
        if (sprite.x > SCREEN_WIDTH - OUT_PIXEL)  sprite.x = SCREEN_WIDTH - OUT_PIXEL;
      };

      // pointstart後、マウスボタンもしくは指を離した瞬間
      // （離す際、ポインタ・指はオブジェクト上に無くても良い）
      sprite.onpointend = () => {
        //console.log("obj.index onpointend", obj.index);
        releaseSemaphore();
      };

      // マウスポインタもしくは指がオブジェクトに乗っかった瞬間
      // （タッチ操作の場合、発火条件がpointstartに近くなるが、若干異なる）
      // （例えばpointover/pointoutの場合、すでに端末上においた指をスライドしてオブジェクトに触れた/離れた際も発火する。）
      sprite.onpointover = () => {
        //console.log("obj.index onpointover", obj.index);
      };
      
      // マウスポインタもしくは指がオブジェクトから離れた瞬間
      // （タッチ操作の場合、発火条件がpointendに近くなるが、若干異なる）
      // （例えばpointover/pointoutの場合、すでに端末上においた指をスライドしてオブジェクトに触れた/離れた際も発火する。）
      sprite.onpointout = () => {
        //console.log("obj.index onpointout", obj.index);
      };
      index++;
    }
  },
  // プレイヤーオブジェクト消去
  erasePlayers: function() {
    //console.log("SceneMainクラスerasePlayers");
    //this.buttonGroup.children.length = 0;
  }
});
