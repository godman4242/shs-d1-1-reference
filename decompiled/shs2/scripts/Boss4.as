package
{
   import flash.display.MovieClip;
   
   [Embed(source="/_assets/assets.swf", symbol="symbol1838")]
   public class Boss4 extends Enemy
   {
      
      public static var instance:Boss4;
      
      public static var typeCode:int = 24;
      
      public var shell:MovieClip;
      
      internal const HURT_STATE:* = 7;
      
      public var firingGrenade:Boolean = false;
      
      internal var invulCounter:int = 0;
      
      internal var formMode:int = 1;
      
      public var bossGuyNext:Boolean = false;
      
      public var explosion:MovieClip;
      
      internal const CHARGE_STATE:* = 8;
      
      internal var chargePhase:int = 0;
      
      public var enemy:MovieClip;
      
      public var canMove:Boolean = true;
      
      public var head:MovieClip;
      
      public function Boss4()
      {
         super();
         addFrameScript(22,frame23,29,frame30,30,frame31);
         instance = this;
         speed = 5;
         AIcounterMax = 3 * 24;
         maxhp = 100;
         hp = maxhp;
         actionState = IDLE_STATE;
         if(StatsManager.bossNoLife)
         {
            hp = 1;
         }
      }
      
      override public function checkEnemyWeaponHitPlayer(param1:MovieClip) : Boolean
      {
         return Player.instance.checkEnemyWeaponHitPlayer(param1);
      }
      
      public function fire1Grenade() : *
      {
         shell.gotoAndPlay(2);
         shell.inside.gotoAndStop(6);
         firingGrenade = true;
      }
      
      internal function AI() : *
      {
         var _loc1_:int = 0;
         if(actionState != CHARGE_STATE && x < 200)
         {
            destinationX = 210;
            actionState = MOVE_STATE;
         }
         else if(actionState == IDLE_STATE && shell.inside.currentFrame == 1)
         {
            switch(formMode)
            {
               case 1:
                  if(bossGuyNext)
                  {
                     if(Math.random() * 3 < 2)
                     {
                        bossGuyLaugh();
                        bossGuyNext = false;
                     }
                  }
                  else
                  {
                     _loc1_ = Math.random() * 3;
                     if(_loc1_ == 0)
                     {
                        fire1Grenade();
                     }
                     else if(_loc1_ == 1)
                     {
                        fire1Rocket();
                     }
                     else if(Math.random() * 10 < 1)
                     {
                        bossGuyLaugh();
                     }
                  }
                  break;
               case 2:
                  if(bossGuyNext)
                  {
                     if(Math.random() * 3 < 2)
                     {
                        bossGuyLaugh();
                        bossGuyNext = false;
                     }
                  }
                  else
                  {
                     _loc1_ = Math.random() * 3;
                     if(_loc1_ == 0)
                     {
                        fire2Grenade();
                     }
                     else if(_loc1_ == 1)
                     {
                        fire2Rocket();
                     }
                     else if(Math.random() * 10 < 1)
                     {
                        bossGuyLaugh();
                     }
                  }
                  break;
               case 3:
                  if(bossGuyNext)
                  {
                     if(Math.random() * 3 < 2)
                     {
                        if(Math.random() * 3 < 2)
                        {
                           bossGuyAttack1();
                        }
                        else
                        {
                           bossGuyLaugh();
                        }
                        bossGuyNext = false;
                     }
                  }
                  else
                  {
                     _loc1_ = Math.random() * 4;
                     if(_loc1_ == 0)
                     {
                        fire2Grenade();
                     }
                     else if(_loc1_ == 1)
                     {
                        fire2Rocket();
                     }
                     else if(_loc1_ == 2)
                     {
                        fireMouthLaser();
                     }
                     else if(Math.random() * 20 < 1)
                     {
                        bossGuyLaugh();
                     }
                  }
                  break;
               case 4:
                  if(bossGuyNext)
                  {
                     if(Math.random() * 3 < 2)
                     {
                        bossGuyAttack2();
                        bossGuyNext = false;
                     }
                  }
                  else
                  {
                     _loc1_ = Math.random() * 5;
                     if(_loc1_ == 0)
                     {
                        fire2Grenade();
                     }
                     else if(_loc1_ == 1)
                     {
                        fire2Rocket();
                     }
                     else if(_loc1_ == 2)
                     {
                        fireMouthLaser();
                     }
                     else if(_loc1_ == 3)
                     {
                        startCharge();
                     }
                     else if(Math.random() * 30 < 1)
                     {
                        bossGuyLaugh();
                     }
                  }
                  break;
               case 5:
                  if(bossGuyNext)
                  {
                     if(Math.random() * 3 < 2)
                     {
                        bossGuyAttack2();
                        bossGuyNext = false;
                     }
                  }
                  else
                  {
                     _loc1_ = Math.random() * 5;
                     if(_loc1_ == 0)
                     {
                        fire4Grenade();
                     }
                     else if(_loc1_ == 1)
                     {
                        fire4Rocket();
                     }
                     else if(_loc1_ == 2)
                     {
                        fireMouthLaser();
                     }
                     else if(_loc1_ == 3)
                     {
                        startCharge();
                     }
                     else if(Math.random() * 40 < 1)
                     {
                        bossGuyLaugh();
                     }
                  }
                  break;
               case 6:
                  if(bossGuyNext)
                  {
                     if(Math.random() * 3 < 2)
                     {
                        if(Math.random() * 2 < 1)
                        {
                           bossGuyAttack2();
                        }
                        else
                        {
                           bossGuyAttack3();
                        }
                        bossGuyNext = false;
                     }
                  }
                  else
                  {
                     _loc1_ = Math.random() * 4;
                     if(_loc1_ == 0)
                     {
                        fire4Grenade();
                     }
                     else if(_loc1_ == 1)
                     {
                        fire4Rocket();
                     }
                     else if(_loc1_ == 2)
                     {
                        fireMouthLaser();
                     }
                     else if(_loc1_ == 3)
                     {
                        startCharge();
                     }
                  }
                  break;
               case 7:
                  if(bossGuyNext)
                  {
                     if(Math.random() * 3 < 2)
                     {
                        _loc1_ = Math.random() * 3;
                        if(_loc1_ == 0)
                        {
                           bossGuyAttack2();
                        }
                        else if(_loc1_ == 1)
                        {
                           bossGuyAttack3();
                        }
                        else
                        {
                           doubleLaser();
                        }
                        bossGuyNext = false;
                     }
                  }
                  else
                  {
                     _loc1_ = Math.random() * 4;
                     if(_loc1_ == 0)
                     {
                        fire4Grenade();
                     }
                     else if(_loc1_ == 1)
                     {
                        fire4Rocket();
                     }
                     else if(_loc1_ == 2)
                     {
                        fireMouthLaser();
                     }
                     else if(_loc1_ == 3)
                     {
                        startCharge();
                     }
                  }
                  break;
               case 8:
                  if(bossGuyNext)
                  {
                     if(Math.random() * 3 < 2)
                     {
                        _loc1_ = Math.random() * 3;
                        if(_loc1_ == 0)
                        {
                           bossGuyAttack2();
                        }
                        else if(_loc1_ == 1)
                        {
                           bossGuyAttack3();
                        }
                        else
                        {
                           doubleLaser();
                        }
                        bossGuyNext = false;
                     }
                  }
                  else
                  {
                     _loc1_ = Math.random() * 4;
                     if(_loc1_ == 0)
                     {
                        fire8Grenade();
                     }
                     else if(_loc1_ == 1)
                     {
                        fire8Rocket();
                     }
                     else if(_loc1_ == 2)
                     {
                        fireMouthLaser();
                     }
                     else if(_loc1_ == 3)
                     {
                        startCharge();
                     }
                  }
                  break;
               case 9:
                  if(bossGuyNext)
                  {
                     if(Math.random() * 3 < 2)
                     {
                        doubleLaser();
                        bossGuyNext = false;
                     }
                  }
                  else
                  {
                     _loc1_ = Math.random() * 5;
                     if(_loc1_ == 0)
                     {
                        fire8Grenade();
                     }
                     else if(_loc1_ == 1)
                     {
                        fire8Rocket();
                     }
                     else if(_loc1_ == 2)
                     {
                        fireMouthLaser();
                     }
                     else if(_loc1_ == 3)
                     {
                        startCharge();
                     }
                     else if(_loc1_ == 4)
                     {
                        doubleLaser();
                     }
                  }
            }
         }
      }
      
      public function fire8Grenade() : *
      {
         shell.gotoAndPlay(2);
         shell.inside.gotoAndStop(9);
         firingGrenade = true;
      }
      
      public function fire8Rocket() : *
      {
         shell.gotoAndPlay(2);
         shell.inside.gotoAndStop(5);
         firingGrenade = false;
      }
      
      internal function bossGuyAttack3() : *
      {
         shell.gotoAndPlay(2);
         if(Math.random() * 2 < 1)
         {
            shell.inside.gotoAndStop(23);
         }
         else
         {
            shell.inside.gotoAndStop(24);
         }
      }
      
      internal function frame23() : *
      {
         gotoAndPlay(1);
      }
      
      internal function updateFormMode() : *
      {
         if(hp <= 0)
         {
            explosion.gotoAndPlay(2);
            InputManager.instance.disable();
            if(Player.instance.powerOn)
            {
               Player.instance.activatePower();
            }
         }
         else if(hp <= 10)
         {
            formMode = 9;
         }
         else if(hp <= 20)
         {
            formMode = 8;
         }
         else if(hp <= 30)
         {
            formMode = 7;
         }
         else if(hp <= 40)
         {
            formMode = 6;
         }
         else if(hp <= 50)
         {
            formMode = 5;
         }
         else if(hp <= 60)
         {
            formMode = 4;
         }
         else if(hp <= 70)
         {
            formMode = 3;
         }
         else if(hp <= 80)
         {
            formMode = 2;
         }
      }
      
      internal function bossGuyAttack2() : *
      {
         var _loc1_:int = 0;
         shell.gotoAndPlay(2);
         _loc1_ = Math.random() * 3;
         if(_loc1_ == 0)
         {
            shell.inside.gotoAndStop(22);
         }
         else if(_loc1_ == 1)
         {
            shell.inside.gotoAndStop(20);
         }
         else if(_loc1_ == 2)
         {
            shell.inside.gotoAndStop(21);
         }
      }
      
      public function updateBossBar() : *
      {
         MovieClip(parent).bosshp.hpbar.width = hp * 5;
         MovieClip(parent).bosshp.hurtbar.width = maxhp * 5;
      }
      
      override public function die() : *
      {
         if(dead)
         {
            return;
         }
         dead = true;
         actionState = DIE_STATE;
      }
      
      internal function bossGuyLaugh() : *
      {
         shell.gotoAndPlay(2);
         shell.inside.gotoAndStop(29);
      }
      
      internal function bossGuyAttack1() : *
      {
         shell.gotoAndPlay(2);
         if(Math.random() * 2 < 1)
         {
            shell.inside.gotoAndStop(20);
         }
         else
         {
            shell.inside.gotoAndStop(21);
         }
      }
      
      internal function frame30() : *
      {
         stop();
      }
      
      override public function continueAnimation() : *
      {
         if(disappearCounter > 0 && !deathAnimDone)
         {
            if(currentFrame != 30 && currentFrame != 31)
            {
               play();
            }
            if(head != null && head.head != null)
            {
               head.head.play();
               if(head.head.laser != null)
               {
                  head.head.laser.play();
               }
            }
            if(shell != null)
            {
               if(shell.currentFrame != 1 && shell.currentFrame != 10)
               {
                  shell.play();
               }
               if(shell.inside.enemy != null)
               {
                  shell.inside.enemy.play();
                  if(shell.inside.enemy.laser != null)
                  {
                     shell.inside.enemy.laser.play();
                     if(shell.inside.enemy.laser.flames != null)
                     {
                        shell.inside.enemy.laser.flames.play();
                     }
                  }
                  if(shell.inside.enemy.flame != null)
                  {
                     shell.inside.enemy.flame.play();
                  }
               }
            }
            if(enemy != null)
            {
               if(enemy.wave1 != null)
               {
                  enemy.wave1.play();
               }
               if(enemy.wave2 != null)
               {
                  enemy.wave2.play();
               }
               if(enemy.grass1 != null)
               {
                  enemy.grass1.play();
               }
               if(enemy.grass2 != null)
               {
                  enemy.grass2.play();
               }
               if(enemy.grass3 != null)
               {
                  enemy.grass3.play();
               }
               if(enemy.grass4 != null)
               {
                  enemy.grass4.play();
               }
               if(enemy.grass5 != null)
               {
                  enemy.grass5.play();
               }
            }
         }
      }
      
      internal function frame31() : *
      {
         stop();
      }
      
      public function fire2Rocket() : *
      {
         shell.gotoAndPlay(2);
         shell.inside.gotoAndStop(3);
         firingGrenade = false;
      }
      
      public function fire4Grenade() : *
      {
         shell.gotoAndPlay(2);
         shell.inside.gotoAndStop(8);
         firingGrenade = true;
      }
      
      public function createGrenade(param1:int) : *
      {
         var _loc2_:* = undefined;
         _loc2_ = 0;
         while(_loc2_ < param1)
         {
            ProjectileManager.instance.createProjectile(Projectile_firebomb.typeCode,Math.random() * GameStage.stageWidth + 200,-50,Math.random() * 5 + 4,0);
            _loc2_++;
         }
      }
      
      override public function update() : *
      {
         if(!canMove || Boolean(Player.instance.isRedFreeze))
         {
            return;
         }
         if(isDead())
         {
            doDisappear();
            return;
         }
         if(invulCounter > 0)
         {
            --invulCounter;
            if(invulCounter == 0)
            {
               actionState = IDLE_STATE;
            }
         }
         --AIcounter;
         if(AIcounter <= 0)
         {
            AIcounter = AIcounterMax;
            AI();
         }
         switch(actionState)
         {
            case IDLE_STATE:
               break;
            case MOVE_STATE:
               doMove();
               break;
            case ATTACK_STATE:
            case DIE_STATE:
            case DOWNED_STATE:
            case JUMP_STATE:
               break;
            case HURT_STATE:
               doHurt();
               break;
            case CHARGE_STATE:
               doCharge();
         }
      }
      
      public function createHomingRocket(param1:int) : *
      {
         var _loc2_:* = undefined;
         var _loc3_:Projectile = null;
         _loc2_ = 0;
         while(_loc2_ < param1)
         {
            _loc3_ = ProjectileManager.instance.createProjectile(Projectile_rocket_homing.typeCode,Math.random() * GameStage.stageWidth + 200,-50,0,5);
            MovieClip(parent).rocketLayer.addChild(_loc3_);
            _loc2_++;
         }
      }
      
      public function createRocket(param1:int) : *
      {
         if(Math.random() * 2 < 1)
         {
            createHomingRocket(param1);
         }
         else
         {
            createRocketDownFromTop(param1);
         }
      }
      
      public function fire2Grenade() : *
      {
         shell.gotoAndPlay(2);
         shell.inside.gotoAndStop(7);
         firingGrenade = true;
      }
      
      internal function doMove() : *
      {
         if(this.x - destinationX >= speed)
         {
            this.x -= speed;
         }
         else if(this.x - destinationX <= -speed)
         {
            this.x += speed;
         }
         else
         {
            actionState = IDLE_STATE;
            if(formMode == 1)
            {
               bossGuyLaugh();
            }
         }
      }
      
      public function fireHomingRocketFromBack() : *
      {
         var _loc1_:Projectile = null;
         _loc1_ = ProjectileManager.instance.createProjectile(Projectile_rocket_homing.typeCode,x,y - 80,0,-5);
         MovieClip(parent).addChild(_loc1_);
      }
      
      public function fireMouthLaser() : *
      {
         if(head.currentFrame != 2)
         {
            head.gotoAndStop(2);
         }
      }
      
      public function fire4Rocket() : *
      {
         shell.gotoAndPlay(2);
         shell.inside.gotoAndStop(4);
         firingGrenade = false;
      }
      
      internal function doHurt() : *
      {
         if(shell.inside.currentFrame != 30)
         {
            shell.inside.gotoAndStop(30);
         }
         if(head.currentFrame != 3)
         {
            head.gotoAndStop(3);
         }
      }
      
      public function createRocketDownFromTop(param1:int) : *
      {
         var _loc2_:* = undefined;
         var _loc3_:Projectile = null;
         _loc2_ = 0;
         while(_loc2_ < param1)
         {
            _loc3_ = ProjectileManager.instance.createProjectile(Projectile_rocket_down.typeCode,Math.random() * GameStage.stageWidth,-Math.random() * 100,0,15);
            MovieClip(parent).rocketLayer.addChild(_loc3_);
            _loc2_++;
         }
      }
      
      internal function doCharge() : *
      {
         if(chargePhase == 1)
         {
            x -= 8;
            if(x <= -100)
            {
               chargePhase = 2;
               gotoAndStop(30);
               destinationX = GameStage.stageWidth - 150;
            }
         }
         else if(chargePhase == 2)
         {
            if(x < destinationX)
            {
               x += 40;
               if(checkEnemyWeaponHitPlayer(this))
               {
                  Player.instance.gotLaunched();
               }
            }
            else
            {
               chargePhase = 3;
               gotoAndStop(31);
            }
         }
         else if(chargePhase == 3)
         {
            x -= 10;
            if(x <= -100)
            {
               destinationX = 200;
               actionState = MOVE_STATE;
               chargePhase = 0;
               gotoAndPlay(1);
            }
         }
      }
      
      override public function scrollRight(param1:int) : *
      {
      }
      
      public function closeLid() : *
      {
         shell.gotoAndPlay(36);
      }
      
      public function fire1Rocket() : *
      {
         shell.gotoAndPlay(2);
         shell.inside.gotoAndStop(2);
         firingGrenade = false;
      }
      
      public function doubleLaser() : *
      {
         shell.gotoAndPlay(2);
         shell.inside.gotoAndStop(22);
         fireMouthLaser();
      }
      
      override public function hit(param1:int, param2:Array, param3:Array) : *
      {
         var _loc4_:* = undefined;
         if(invulCounter == 0 && actionState == IDLE_STATE && shell.inside.currentFrame >= 20 && shell.inside.currentFrame < 30)
         {
            _loc4_ = 0;
            while(_loc4_ < param2.length)
            {
               if(shell.inside.hitTestPoint(param2[_loc4_],param3[_loc4_]))
               {
                  actionState = HURT_STATE;
                  hp -= 10;
                  SoundManager.instance.playHit();
                  updateBossBar();
                  invulCounter = 10;
                  updateFormMode();
                  return;
               }
               _loc4_++;
            }
         }
      }
      
      public function hitByJetpack() : *
      {
         if(invulCounter == 0 && (actionState == IDLE_STATE || actionState == MOVE_STATE))
         {
            shell.lid.gotoAndStop(2);
            bossGuyNext = true;
            head.gotoAndStop(3);
            hp -= 5;
            updateBossBar();
            invulCounter = 10;
            updateFormMode();
            SoundManager.instance.playBoss4Hurt();
         }
      }
      
      internal function immediateAI() : *
      {
      }
      
      override public function downSlashHit() : *
      {
      }
      
      override public function stopAnimation() : *
      {
         stop();
         if(head != null && head.head != null)
         {
            head.head.stop();
            if(head.head.laser != null)
            {
               head.head.laser.stop();
            }
         }
         if(shell != null)
         {
            shell.stop();
            if(shell.inside.enemy != null)
            {
               shell.inside.enemy.stop();
               if(shell.inside.enemy.laser != null)
               {
                  shell.inside.enemy.laser.stop();
                  if(shell.inside.enemy.laser.flames != null)
                  {
                     shell.inside.enemy.laser.flames.stop();
                  }
               }
               if(shell.inside.enemy.flame != null)
               {
                  shell.inside.enemy.flame.stop();
               }
            }
         }
         if(enemy != null)
         {
            if(enemy.wave1 != null)
            {
               enemy.wave1.stop();
            }
            if(enemy.wave2 != null)
            {
               enemy.wave2.stop();
            }
            if(enemy.grass1 != null)
            {
               enemy.grass1.stop();
            }
            if(enemy.grass2 != null)
            {
               enemy.grass2.stop();
            }
            if(enemy.grass3 != null)
            {
               enemy.grass3.stop();
            }
            if(enemy.grass4 != null)
            {
               enemy.grass4.stop();
            }
            if(enemy.grass5 != null)
            {
               enemy.grass5.stop();
            }
         }
      }
      
      internal function startCharge() : *
      {
         chargePhase = 1;
         actionState = CHARGE_STATE;
      }
   }
}

