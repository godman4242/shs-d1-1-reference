package
{
   import flash.display.MovieClip;
   
   [Embed(source="/_assets/assets.swf", symbol="symbol1454")]
   public class PortraitBust extends MovieClip
   {
      
      public var bust:MCSBust;
      
      public function PortraitBust()
      {
         super();
         this.bust.scaleX = 2;
         this.bust.scaleY = 2;
      }
      
      public function initMCS(armorid:Item, hairid:Item, hatid:Item, headid:Item, maskid:Item, neckid:Item) : *
      {
         this.bust.initMCS(armorid,hairid,hatid,headid,maskid,neckid);
      }
      
      public function initMCSFromNPCID(npcID:int) : *
      {
         this.bust.initMCSFromNPCID(npcID);
      }
      
      public function initMCSFromPlayer() : *
      {
         this.bust.initMCSFromPlayer();
      }
      
      public function initMCSFromEqString(str:String) : *
      {
         this.bust.initMCSFromEqString(str);
      }
      
      public function faceLeft() : *
      {
         this.bust.scaleX = -1;
      }
      
      public function faceRight() : *
      {
         this.bust.scaleX = 1;
      }
      
      public function disposeMCSBust() : *
      {
         this.bust.disposeMCSBust();
      }
   }
}

