package
{
   import flash.display.MovieClip;
   
   [Embed(source="/_assets/assets.swf", symbol="symbol2134")]
   public class Trap_SpikeBallAuto extends TriggeredAutoStageObject
   {
      
      public var spikeball:MovieClip;
      
      internal var rotspeed:int = 10;
      
      internal var damageObj:Damage;
      
      public function Trap_SpikeBallAuto(props:String, objname:String = "")
      {
         super();
         this.props = props;
         if(objname == "")
         {
            objectName = "Trap";
         }
         else
         {
            objectName = objname;
         }
         var damage:int = 20;
         var strArray:Array = props.split(",");
         if(strArray.length >= 1)
         {
            this.rotspeed = int(strArray[0]);
         }
         if(strArray.length >= 2)
         {
            this.spikeball.gotoAndStop(int(strArray[1]));
         }
         if(strArray.length >= 3)
         {
            this.spikeball.rotation = int(strArray[2]);
         }
         if(strArray.length >= 4 && strArray[3] == "1")
         {
            damage = 10000;
         }
         this.damageObj = new Damage(damage,0,Damage.LAUNCH_KNOCKDOWN);
         this.spikeball.hitarea.visible = false;
      }
      
      override public function update() : *
      {
         this.spikeball.rotation += this.rotspeed;
      }
      
      override public function isInInteractRange(mc:MovieClip) : Boolean
      {
         if(abs(x - mc.x) < 150 && !StatsManager.getPlayer().isDowned())
         {
            NPCManager.checkPlayerHitObject(this.spikeball.hitarea,this.damageObj,150,false,this);
         }
         return false;
      }
      
      override internal function doAction() : *
      {
      }
   }
}

