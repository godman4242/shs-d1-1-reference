package
{
   import flash.display.MovieClip;
   
   [Embed(source="/_assets/assets.swf", symbol="symbol2144")]
   public class Trap_Jump extends TriggeredStageObject
   {
      
      public function Trap_Jump(props:String, objname:String = "")
      {
         super();
         addFrameScript(0,this.frame1);
         this.props = props;
         if(objname == "")
         {
            objectName = "Trap";
         }
         else
         {
            objectName = objname;
         }
         var strArray:Array = props.split(",");
         if(strArray.length >= 1)
         {
            active = strArray[0] != "0";
            visible = active;
         }
         if(strArray.length >= 2)
         {
            gotoAndStop(int(strArray[1]));
         }
      }
      
      override public function showInteractButton(flag:Boolean) : *
      {
         if(!active)
         {
            return;
         }
         var owner:MCSPlayer = StatsManager.getPlayer();
         owner.startAction(MCSActor.JUMP_STATE);
         NetworkManager.instance.startAction(MCSActor.JUMP_STATE,owner.getMapPosition(),owner.getMCS().y,owner.getMCS().isFacingRight());
      }
      
      override public function isInInteractRange(mc:MovieClip) : Boolean
      {
         return abs(x - mc.x) < 50 && mc.hitTestObject(this);
      }
      
      override public function triggerObject(flag:Boolean, isFloorSwitch:Boolean) : *
      {
         active = flag;
         visible = flag;
      }
      
      internal function frame1() : *
      {
         stop();
      }
   }
}

