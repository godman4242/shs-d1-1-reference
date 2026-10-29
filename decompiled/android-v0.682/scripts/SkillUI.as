package
{
   import flash.display.MovieClip;
   import flash.display.SimpleButton;
   
   [Embed(source="/_assets/assets.swf", symbol="symbol2867")]
   public class SkillUI extends MovieClip
   {
      
      public static var instance:SkillUI;
      
      public var node0:MovieClip;
      
      public var clearButton:SimpleButton;
      
      public var node1:MovieClip;
      
      public var node2:MovieClip;
      
      public var node3:MovieClip;
      
      public var node4:MovieClip;
      
      public var node5:MovieClip;
      
      public var greenCircle:MovieClip;
      
      public var closeButton:SimpleButton;
      
      public var node6:MovieClip;
      
      public var redCircle:MovieClip;
      
      public var node7:MovieClip;
      
      public var doSkillButton:MovieClip;
      
      internal var skillValue:Vector.<int> = new Vector.<int>();
      
      internal var prev:int = -1;
      
      internal var nodeList:Vector.<MovieClip> = new Vector.<MovieClip>();
      
      internal var skillStr:String = "";
      
      public function SkillUI()
      {
         super();
         instance = this;
         this.nodeList.push(this.node0);
         this.nodeList.push(this.node1);
         this.nodeList.push(this.node2);
         this.nodeList.push(this.node3);
         this.nodeList.push(this.node4);
         this.nodeList.push(this.node5);
         this.nodeList.push(this.node6);
         this.nodeList.push(this.node7);
         this.nodeList.fixed = true;
      }
      
      public function reset() : *
      {
         this.prev = -1;
         this.skillStr = "";
         this.skillValue.length = 0;
         var i:* = 7;
         while(i > -1)
         {
            this.nodeList[i].gotoAndStop(1);
            i--;
         }
         this.greenCircle.visible = true;
         this.redCircle.visible = false;
         InputManager.clearCanvas();
         InputManager.greenLine();
         scaleX = StatsManager.stageScale;
         scaleY = StatsManager.stageScale;
         x = StatsManager.stageOffsetX;
         y = StatsManager.stageOffsetY;
      }
      
      public function gotClicked(mousex:int, mousey:int) : Boolean
      {
         if(this.clearButton.hitTestPoint(mousex,mousey))
         {
            this.clearButtonClick();
            return true;
         }
         if(this.closeButton.hitTestPoint(mousex,mousey))
         {
            this.closeButtonClick();
            return true;
         }
         if(this.doSkillButton.hitTestPoint(mousex,mousey))
         {
            this.doSkillButtonClick();
            return true;
         }
         return false;
      }
      
      internal function clearButtonClick() : *
      {
         InputManager.clearCanvas();
         this.reset();
      }
      
      internal function closeButtonClick() : *
      {
         if(visible)
         {
            visible = false;
            InputManager.setBattleMode();
         }
      }
      
      internal function doSkillButtonClick() : *
      {
         var max:int = int(this.skillValue.length);
         var i:* = 0;
         while(i < max)
         {
            this.skillStr += this.skillValue[i].toString();
            i++;
         }
         if(this.skillStr == "012")
         {
            this.redCircle.visible = true;
            i = 7;
            while(i > -1)
            {
               this.nodeList[i].gotoAndStop(4);
               i--;
            }
            InputManager.clearCanvas();
            InputManager.redLine();
         }
         else
         {
            this.performSkill();
            this.closeButtonClick();
         }
      }
      
      public function checkNode(mousex:int, mousey:int) : *
      {
         var node:MovieClip = null;
         var max:int = int(this.nodeList.length);
         for(var i:* = int(max - 1); i > -1; i--)
         {
            node = this.nodeList[i];
            if(i != this.prev && node.hitTestPoint(mousex,mousey))
            {
               this.skillValue.push(i);
               this.prev = i;
               if(node.currentFrame == 1 || node.currentFrame == 4)
               {
                  node.gotoAndStop(2);
               }
               else if(node.currentFrame == 2)
               {
                  node.gotoAndStop(3);
               }
               StatsManager.getPlayer().doPose(i);
               return;
            }
         }
      }
      
      internal function performSkill() : *
      {
         if(StageManager.isPeaceful())
         {
            return;
         }
         switch(this.skillStr)
         {
            case "345":
               BattleUI.instance.setSelectTargetMode();
               break;
            case "543":
         }
      }
      
      public function performSkillOnTarget(enemy:NPC) : *
      {
         var _loc2_:String = this.skillStr;
         switch(0)
         {
         }
      }
   }
}

