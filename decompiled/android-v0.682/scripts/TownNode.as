package
{
   [Embed(source="/_assets/assets.swf", symbol="symbol183")]
   public class TownNode extends GenericNode
   {
      
      public var arrow:ArrowBouncing;
      
      public function TownNode(nodeID:int = -1, x:int = 0, y:int = 0)
      {
         super();
         addFrameScript(0,this.frame1,1,this.frame2,3,this.frame4,4,this.frame5);
         ID = nodeID;
         this.x = x;
         this.y = y;
         nodeTypeID = 1;
         setEventListeners();
         selectedArrow = this.arrow;
         selectedArrow.visible = false;
         selectedArrow.mouseenabled = false;
      }
      
      internal function frame1() : *
      {
         stop();
      }
      
      internal function frame2() : *
      {
         stop();
      }
      
      internal function frame4() : *
      {
         stop();
      }
      
      internal function frame5() : *
      {
         stop();
      }
   }
}

