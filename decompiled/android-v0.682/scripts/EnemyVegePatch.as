package
{
   import flash.display.MovieClip;
   
   public class EnemyVegePatch extends NPC
   {
      
      internal var mc:MovieClip;
      
      internal var vegArray:Array = new Array();
      
      public function EnemyVegePatch(mcs:MCSCharacter = null)
      {
         super();
         if(mcs == null)
         {
            this.mcs = new MCSCharacter();
         }
         else
         {
            this.mcs = mcs;
         }
         this.mc = new Enemy_VegePatch();
         LangManager.initTextField(this.mc.tutmessage.tutmessage);
         this.mc.tutmessage.tutmessage.text = LangManager.getString(267);
         this.vegArray.push(this.mc.vege0);
         this.vegArray.push(this.mc.vege1);
         this.vegArray.push(this.mc.vege2);
         this.vegArray.push(this.mc.vege3);
         this.vegArray.push(this.mc.vege4);
         this.vegArray.push(this.mc.vege5);
         this.vegArray.push(this.mc.vege6);
         this.vegArray.push(this.mc.vege7);
         this.vegArray.push(this.mc.vege8);
         this.vegArray.push(this.mc.vege9);
         for(var i:int = 0; i < 10; i++)
         {
            this.vegArray[i].gotoAndStop(int(Math.random() * 7 + 1));
            this.vegArray[i].rotation = Math.random() * 20 - 10;
         }
      }
      
      override public function setPosition(x:int, y:int) : *
      {
         this.mc.x = x - StageManager.getStagePosition();
         this.mc.y = y;
         posX = x;
         mcs.x = x;
         mcs.y = y;
      }
      
      override public function addToCanvas(canvas:MovieClip) : *
      {
         canvas.addChild(this.mc);
      }
      
      override public function removeFromCanvas(canvas:MovieClip) : *
      {
         canvas.removeChild(this.mc);
      }
      
      override public function movePositionX(x:int) : *
      {
         this.mc.x += x;
         posX += x;
      }
      
      override public function redFreeze() : *
      {
         ColorCode.makeBlack(this.mc);
         animFrozen = true;
         this.mc.tutmessage.visible = false;
      }
      
      override public function clearFilter() : *
      {
         ColorCode.clearFilter(this.mc);
         this.mc.tutmessage.visible = true;
      }
      
      override public function update() : *
      {
         if(gotHitCounter > 0)
         {
            --gotHitCounter;
         }
      }
      
      override public function checkHit(hitX:int, hitY:int, damageObj:Damage) : Boolean
      {
         if(gotHitCounter > 0)
         {
            return false;
         }
         if(!this.mc.hitTestPoint(hitX,hitY))
         {
            return false;
         }
         if(getHP() > 0)
         {
            setHP(getHP() - 1);
            gotHitCounter = 12;
            if(getHP() > 0)
            {
               this.mc.healthBar.bar.width = getHP() / maxhp * 60;
            }
            else
            {
               this.mc.healthBar.visible = false;
            }
            this.createProjectile();
            SoundManager.instance.playHit();
         }
         return true;
      }
      
      override public function checkHitObject(thing:MovieClip, damageObj:Damage, checkByAttacker:Boolean = false) : Boolean
      {
         if(gotHitCounter > 0)
         {
            return false;
         }
         if(!this.mc.hitTestObject(thing))
         {
            return false;
         }
         if(getHP() > 0)
         {
            setHP(getHP() - 1);
            gotHitCounter = 12;
            if(getHP() > 0)
            {
               this.mc.healthBar.bar.width = getHP() / maxhp * 60;
            }
            else
            {
               this.mc.healthBar.visible = false;
            }
            this.createProjectile();
            SoundManager.instance.playHit();
         }
         gotHitFlag = false;
         return true;
      }
      
      internal function createProjectile() : *
      {
         var index:int = Math.random() * this.vegArray.length;
         var projectile:VegetableProjectile = this.vegArray[index];
         this.vegArray.splice(index,1);
         var mcx:int = projectile.x + this.mc.x;
         ProjectileManager.createVegetableProjectile(mcx,this.mc.y - 50,Math.random() * 20 - 10,-Math.random() * 10 - 20,-1,projectile);
      }
      
      override public function die() : *
      {
         dead = true;
         mcs.disposeMCS();
         mcs = null;
         OverworldHUD.instance.lootDialog.addLootItemBasic(20040,1);
      }
   }
}

