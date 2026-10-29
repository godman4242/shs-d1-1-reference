package
{
   [Embed(source="/_assets/assets.swf", symbol="symbol2147")]
   public class Trap_ElementAuto extends TriggeredAutoStageObject
   {
      
      internal var xvel:int = 1;
      
      internal var elementType:int = 0;
      
      public function Trap_ElementAuto(props:String, objname:String = "")
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
            this.xvel = int(strArray[0]);
         }
         if(strArray.length >= 2)
         {
            this.elementType = int(strArray[1]);
         }
         if(strArray.length >= 3)
         {
            onDuration = int(strArray[2]);
         }
         if(strArray.length >= 4)
         {
            offDuration = int(strArray[3]);
         }
         if(strArray.length >= 5)
         {
            startInterval = int(strArray[4]);
         }
         if(strArray.length >= 6)
         {
            active = strArray[5] == "1";
         }
         timeCounter = offDuration - startInterval;
         if(this.elementType == 2 || this.elementType == 3)
         {
            gotoAndStop(2);
         }
         if(this.xvel == 1)
         {
            scaleX = 1;
         }
         else
         {
            scaleX = -1;
         }
      }
      
      override internal function doAction() : *
      {
         var projType:int = 0;
         var yChange:int = -55;
         var xChange:int = 20;
         if(this.elementType == 0)
         {
            projType = ProjectileManager.PROJ_FIREBREATH;
         }
         else if(this.elementType == 1)
         {
            projType = ProjectileManager.PROJ_WINDKICK;
         }
         else if(this.elementType == 2)
         {
            projType = ProjectileManager.PROJ_WATERSPLASH;
            yChange = 0;
         }
         else if(this.elementType == 3)
         {
            projType = ProjectileManager.PROJ_GROUNDPUNCH;
            yChange = 0;
         }
         var stagePos:int = StageManager.getGameStage().getStagePosition();
         if(this.xvel == 1)
         {
            ProjectileManager.createProjectile(projType,x + xChange + stagePos,y + yChange,1,0,20,1,null);
         }
         else
         {
            ProjectileManager.createProjectile(projType,x - xChange + stagePos,y + yChange,-1,0,20,1,null);
         }
      }
      
      internal function frame1() : *
      {
         stop();
      }
   }
}

