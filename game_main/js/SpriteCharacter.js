phina.define("SpriteCharacter", {
  superClass: "SpriteBase",

  // コンストラクタ
  init: function(spritesheet, animation, x, y, index, width, height) {
    //console.log("SpriteCharacterクラスinit");
    this.superInit(spritesheet, animation, x, y, width, height);
    // 初期位置
    this.sprite.x = x;
    this.sprite.y = y;
    // spriteの配置順
    this.index = index;
    // 当たり判定用オブジェクト
    this.circle = Circle(this.sprite.x, this.sprite.y, this.sprite.radius);
    // 当たり判定完了フラグ（true：未完了　false：判定完了）
    this.matchFlg = false;
    // 一番手前のsprite以外の場合の座標
    this.fixed_x = -1;
    this.fixed_y = -1;
  },
  update: function() {
    if (this.fixed_x >= 0 && this.fixed_y >= 0) {
      this.sprite.x = this.fixed_x;
      this.sprite.y = this.fixed_y;
    }
    // 反射ベクトル適用
    if (this.sprite.y < 0) {
      //console.log("velocity", this.sprite.flickable.velocity);
      this.sprite.flickable.velocity = Vector2.reflect(this.sprite.flickable.velocity, UP_LINE);
    }
    if (this.sprite.x < 0) {
      this.sprite.flickable.velocity = Vector2.reflect(this.sprite.flickable.velocity, LEFT_LINE);
    }
    if (this.sprite.x > SCREEN_WIDTH) {
      this.sprite.flickable.velocity = Vector2.reflect(this.sprite.flickable.velocity, RIGHT_LINE);
    }
    if (this.sprite.y > SCREEN_HEIGHT) {
      this.sprite.flickable.velocity = Vector2.reflect(this.sprite.flickable.velocity, DOWN_LINE);
    }
  },
  moveRandom: function () {
    this.sprite.x = rand(0, SCREEN_WIDTH);
    this.sprite.y = rand(INIT_PIECE_Y, SCREEN_HEIGHT);
  },
  matchCheck: function() {
    // マッチ判定（true：マッチ、false：アンマッチ）
    let result = false;
    GameMain.frameGroup.children.forEach(e=> {
      if (this.spritesheet.slice(-2) == e.spritesheet.slice(-2)) {
        let c1 = Circle(this.sprite.x, this.sprite.y, MATCH_PIXEL);
        let c2 = Circle(e.sprite.x, e.sprite.y, MATCH_PIXEL); 
        if (Collision.testCircleCircle(c1, c2)) {
          //console.log("Collision.testCircleCircle(c1, c2)", Collision.testCircleCircle(c1, c2));
          // 当たり判定完了フラグ（true：未完了　false：判定完了）
          this.matchFlg = true;
          // 座標を合わせてクリック処理停止
          this.sprite.x = e.sprite.x;
          this.sprite.y = e.sprite.y;
          this.sprite.setInteractive(false)
          // 周りに星を出す
          for (let i = 0; i < 36; i++) {
            let s = phina.display.StarShape()
              .addChildTo(this.sprite)
              .setScale(1);
            let x = s.x + Math.cos(i*10)*100;
            let y = s.y + Math.sin(i*10)*100;
            s.tweener.clear()
              .to({x: x, y: y, alpha: 0}, 1000,"easeOutQuint")
              .call(function() {
                this.remove();
              }.bind(s));
          }
          result = true;
        }
      }
    })
    return result;
  }
});