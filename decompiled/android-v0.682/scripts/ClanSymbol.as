package
{
   import flash.display.MovieClip;
   
   [Embed(source="/_assets/assets.swf", symbol="symbol458")]
   public class ClanSymbol extends MovieClip
   {
      
      public var logo:MovieClip;
      
      public var bg:MovieClip;
      
      public function ClanSymbol()
      {
         super();
      }
      
      public function init(bgColor:int, logoId:int, logoColor:int) : *
      {
         ColorCode.changeColor(this.bg,bgColor);
         this.logo.gotoAndStop(logoId);
         ColorCode.changeColor(this.logo,logoColor);
      }
   }
}

