package
{
   import flash.display.*;
   import flash.events.*;
   import flash.net.*;
   import flash.system.*;
   import flash.text.*;
   import flash.utils.*;
   
   public class lb extends MovieClip
   {
      
      if(false)
      {
      }
      if(false)
      {
      }
      
      private var §\x18\x1b\x17\r\x1b\n\x1b\n\n\x17§:ByteArray;
      
      private var §\n\n\x17\x18\x18\x17\t\t\x0b\n§:Loader;
      
      private var §\r\x0b\t\n\x1b\n\x17\n\r\x18§:LoaderContext;
      
      private var §\n\x1b\x1b\n\r\n\x17\x1b\n\t§:Loader;
      
      private var §\x18\x1b\r\x18\x0b\x18\r\x0b\t\x17\x0b§:LoaderContext;
      
      private var §\x0b\n\x18\x1b\n\r\x1b\x17\x17\x0b\x17\r\n\x1b§:ByteArray;
      
      private var §\r\t\x17\x17\x0b\t\r\r\x0b§:ByteArray;
      
      private var §\r\r\x18\t\x0b\x1b\r\x1b\x1b\x1b§:int = 64;
      
      private var §\x18\x1b\x0b\t\x1b\x0b\t\x17\x18\x1b\r\x0b\r§:int;
      
      private var §\x1b\x18\n\r\x17\x0b\t\n§:int;
      
      private var §\x18\t\x17\x0b\r\r\x1b\r\x1b\x1b\r§:int;
      
      private var §\r\x0b\n\t\x0b\x18\r\t\r§:ByteArray;
      
      private var §\n\x1b\t\n\r\x0b\t\x17§:int;
      
      private var §\t\n\x17\t\n\r\r\r§:int;
      
      private var §\x0b\x18\n\t\r\x18\x17\r\t\x0b\x17\x1b§:int;
      
      public function lb()
      {
         super();
         addFrameScript(0,this.initSWF);
         addFrameScript(1,this.§\x18\x18\x0b\n\t\n\x0b\r\n\r\r§);
      }
      
      private function initSWF() : void
      {
         if(false)
         {
         }
         stop();
         this.§\r\x0b\x17\n\x18\x17\x1b\x18\x1b\x17\n§();
      }
      
      private function §\r\x0b\x17\n\x18\x17\x1b\x18\x1b\x17\n§() : void
      {
         if(false)
         {
         }
         this.§\x18\x1b\x17\r\x1b\n\x1b\n\n\x17§ = ByteArray(new (getDefinitionByName("\n\x18\x18\t\x17\n\r\x17\x17\n") as Class)());
         this.§\x18\x1b\x17\r\x1b\n\x1b\n\n\x17§.endian = "littleEndian";
         this.§\x18\x1b\x17\r\x1b\n\x1b\n\n\x17§.position = 0;
         this.§\n\n\x17\x18\x18\x17\t\t\x0b\n§ = new Loader();
         this.addChildAt(this.§\n\n\x17\x18\x18\x17\t\t\x0b\n§,0);
         this.§\r\x0b\t\n\x1b\n\x17\n\r\x18§ = new LoaderContext();
         this.§\r\x0b\t\n\x1b\n\x17\n\r\x18§.applicationDomain = new ApplicationDomain();
         this.§\n\n\x17\x18\x18\x17\t\t\x0b\n§.loadBytes(this.§\x18\x1b\x17\r\x1b\n\x1b\n\n\x17§,this.§\r\x0b\t\n\x1b\n\x17\n\r\x18§);
         if(false)
         {
         }
      }
      
      private function §\x18\x18\x0b\n\t\n\x0b\r\n\r\r§() : void
      {
         stop();
         this.§\x0b\n\x18\x1b\n\r\x1b\x17\x17\x0b\x17\r\n\x1b§ = ByteArray(new (getDefinitionByName("\x18\x1b\x18\t\n\x17\n\n\r\r\x18\x0b\x18\r") as Class)());
         this.§\x0b\n\x18\x1b\n\r\x1b\x17\x17\x0b\x17\r\n\x1b§.endian = "littleEndian";
         this.§\x0b\n\x18\x1b\n\r\x1b\x17\x17\x0b\x17\r\n\x1b§.position = 0;
         this.§\r\t\x17\x17\x0b\t\r\r\x0b§ = new ByteArray();
         this.§\r\t\x17\x17\x0b\t\r\r\x0b§.writeBytes(this.§\x0b\n\x18\x1b\n\r\x1b\x17\x17\x0b\x17\r\n\x1b§,this.§\x0b\n\x18\x1b\n\r\x1b\x17\x17\x0b\x17\r\n\x1b§.length - 8,8);
         this.§\x1b\r\t\x17\n\n\x0b\x1b§();
         this.§\n\x1b\x1b\n\r\n\x17\x1b\n\t§ = new Loader();
         this.removeChildAt(0);
         this.addChildAt(this.§\n\x1b\x1b\n\r\n\x17\x1b\n\t§,0);
         this.§\x18\x1b\r\x18\x0b\x18\r\x0b\t\x17\x0b§ = new LoaderContext();
         this.§\x18\x1b\r\x18\x0b\x18\r\x0b\t\x17\x0b§.applicationDomain = new ApplicationDomain();
         this.§\n\x1b\x1b\n\r\n\x17\x1b\n\t§.loadBytes(this.§\x0b\n\x18\x1b\n\r\x1b\x17\x17\x0b\x17\r\n\x1b§,this.§\x18\x1b\r\x18\x0b\x18\r\x0b\t\x17\x0b§);
      }
      
      private function §\x1b\r\t\x17\n\n\x0b\x1b§() : void
      {
         this.§\x18\x1b\x0b\t\x1b\x0b\t\x17\x18\x1b\r\x0b\r§ = this.§\x0b\n\x18\x1b\n\r\x1b\x17\x17\x0b\x17\r\n\x1b§.length < this.§\r\r\x18\t\x0b\x1b\r\x1b\x1b\x1b§ ? int(this.§\x0b\n\x18\x1b\n\r\x1b\x17\x17\x0b\x17\r\n\x1b§.length) : this.§\r\r\x18\t\x0b\x1b\r\x1b\x1b\x1b§;
         this.§\x1b\x18\n\r\x17\x0b\t\n§ = 0;
         this.§\x18\t\x17\x0b\r\r\x1b\r\x1b\x1b\r§ = 0;
         this.§\r\x0b\n\t\x0b\x18\r\t\r§ = new ByteArray();
         this.§\n\x1b\t\n\r\x0b\t\x17§ = 0;
         while(this.§\n\x1b\t\n\r\x0b\t\x17§ < 256)
         {
            this.§\r\x0b\n\t\x0b\x18\r\t\r§[this.§\n\x1b\t\n\r\x0b\t\x17§] = this.§\n\x1b\t\n\r\x0b\t\x17§;
            ++this.§\n\x1b\t\n\r\x0b\t\x17§;
         }
         this.§\t\n\x17\t\n\r\r\r§ = 0;
         this.§\n\x1b\t\n\r\x0b\t\x17§ = 0;
         while(this.§\n\x1b\t\n\r\x0b\t\x17§ < 256)
         {
            this.§\t\n\x17\t\n\r\r\r§ = this.§\t\n\x17\t\n\r\r\r§ + this.§\r\x0b\n\t\x0b\x18\r\t\r§[this.§\n\x1b\t\n\r\x0b\t\x17§] + this.§\r\t\x17\x17\x0b\t\r\r\x0b§[this.§\n\x1b\t\n\r\x0b\t\x17§ % this.§\r\t\x17\x17\x0b\t\r\r\x0b§.length] & 0xFF;
            this.§\x0b\x18\n\t\r\x18\x17\r\t\x0b\x17\x1b§ = this.§\r\x0b\n\t\x0b\x18\r\t\r§[this.§\n\x1b\t\n\r\x0b\t\x17§];
            this.§\r\x0b\n\t\x0b\x18\r\t\r§[this.§\n\x1b\t\n\r\x0b\t\x17§] = this.§\r\x0b\n\t\x0b\x18\r\t\r§[this.§\t\n\x17\t\n\r\r\r§];
            this.§\r\x0b\n\t\x0b\x18\r\t\r§[this.§\t\n\x17\t\n\r\r\r§] = this.§\x0b\x18\n\t\r\x18\x17\r\t\x0b\x17\x1b§;
            ++this.§\n\x1b\t\n\r\x0b\t\x17§;
         }
         this.§\n\x1b\t\n\r\x0b\t\x17§ = 0;
         while(this.§\n\x1b\t\n\r\x0b\t\x17§ < this.§\x18\x1b\x0b\t\x1b\x0b\t\x17\x18\x1b\r\x0b\r§)
         {
            this.§\x1b\x18\n\r\x17\x0b\t\n§ = this.§\x1b\x18\n\r\x17\x0b\t\n§ + 1 & 0xFF;
            this.§\x18\t\x17\x0b\r\r\x1b\r\x1b\x1b\r§ = this.§\x18\t\x17\x0b\r\r\x1b\r\x1b\x1b\r§ + this.§\r\x0b\n\t\x0b\x18\r\t\r§[this.§\x1b\x18\n\r\x17\x0b\t\n§] & 0xFF;
            this.§\t\n\x17\t\n\r\r\r§ = this.§\r\x0b\n\t\x0b\x18\r\t\r§[this.§\x1b\x18\n\r\x17\x0b\t\n§];
            this.§\r\x0b\n\t\x0b\x18\r\t\r§[this.§\x1b\x18\n\r\x17\x0b\t\n§] = this.§\r\x0b\n\t\x0b\x18\r\t\r§[this.§\x18\t\x17\x0b\r\r\x1b\r\x1b\x1b\r§];
            this.§\r\x0b\n\t\x0b\x18\r\t\r§[this.§\x18\t\x17\x0b\r\r\x1b\r\x1b\x1b\r§] = this.§\t\n\x17\t\n\r\r\r§;
            this.§\x0b\n\x18\x1b\n\r\x1b\x17\x17\x0b\x17\r\n\x1b§[this.§\n\x1b\t\n\r\x0b\t\x17§] ^= this.§\r\x0b\n\t\x0b\x18\r\t\r§[this.§\t\n\x17\t\n\r\r\r§ + this.§\r\x0b\n\t\x0b\x18\r\t\r§[this.§\x1b\x18\n\r\x17\x0b\t\n§] & 0xFF];
            ++this.§\n\x1b\t\n\r\x0b\t\x17§;
         }
      }
   }
}

