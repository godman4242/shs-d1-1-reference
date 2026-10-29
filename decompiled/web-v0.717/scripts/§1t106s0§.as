package
{
   public class §1t106s0§
   {
      
      public var id:int;
      
      internal var name:String = "";
      
      internal var §1t2184s0§:int = 400;
      
      internal var §1t2185s0§:Boolean = true;
      
      internal var §1t2186s0§:int = 1600;
      
      internal var §1t2187s0§:Boolean = true;
      
      internal var §1t2188s0§:int = 0;
      
      internal var §1t2189s0§:int = 0;
      
      internal var §1t2190s0§:int = 0;
      
      internal var §1t2191s0§:int = 0;
      
      internal var §1t2192s0§:int = 0;
      
      internal var §1t2193s0§:int = 1600;
      
      internal var §1t2194s0§:int = 1600;
      
      internal var §1t2195s0§:int = 1600;
      
      internal var §1t2196s0§:int = 1600;
      
      internal var §1t2197s0§:int = 1600;
      
      internal var §1t2198s0§:int = 8;
      
      internal var §1t2199s0§:int = 4;
      
      internal var §1t2200s0§:int = 0;
      
      internal var §1t2201s0§:int = 4;
      
      internal var §1t2202s0§:int = 8;
      
      internal var §1t2203s0§:Number = 0.25;
      
      internal var §1t2204s0§:Number = 0.3333333333333333;
      
      internal var §1t2205s0§:Number = 0.5;
      
      internal var §1t2206s0§:Number = 1;
      
      internal var §1t2207s0§:Number = 2;
      
      public function §1t106s0§(param1:XML)
      {
         super();
         if(param1 == null)
         {
            return;
         }
         this.id = param1.id;
         this.name = this.§1t796s0§(param1.name);
         if(param1.groundy.toString() != "")
         {
            this.§1t2184s0§ = param1.groundy;
         }
         if(param1.flatground.toString() != "")
         {
            this.§1t2185s0§ = param1.flatground == "1";
         }
         if(param1.contentwidth.toString() != "")
         {
            this.§1t2186s0§ = param1.contentwidth;
         }
         if(param1.wrap.toString() != "")
         {
            this.§1t2187s0§ = param1.wrap == "1";
         }
         if(param1.ffcount.toString() != "")
         {
            this.§1t2188s0§ = param1.ffcount;
         }
         if(param1.fcount.toString() != "")
         {
            this.§1t2189s0§ = param1.fcount;
         }
         if(param1.ppcount.toString() != "")
         {
            this.§1t2190s0§ = param1.ppcount;
         }
         if(param1.gcount.toString() != "")
         {
            this.§1t2191s0§ = param1.gcount;
         }
         if(param1.fgcount.toString() != "")
         {
            this.§1t2192s0§ = param1.fgcount;
         }
         if(param1.ffwrap.toString() != "")
         {
            this.§1t2193s0§ = param1.ffwrap;
         }
         if(param1.fwrap.toString() != "")
         {
            this.§1t2194s0§ = param1.fwrap;
         }
         if(param1.ppwrap.toString() != "")
         {
            this.§1t2195s0§ = param1.ppwrap;
         }
         if(param1.gwrap.toString() != "")
         {
            this.§1t2196s0§ = param1.gwrap;
         }
         if(param1.fgwrap.toString() != "")
         {
            this.§1t2197s0§ = param1.fgwrap;
         }
         if(param1.ffblur.toString() != "")
         {
            this.§1t2198s0§ = param1.ffblur;
         }
         if(param1.fblur.toString() != "")
         {
            this.§1t2199s0§ = param1.fblur;
         }
         if(param1.ppblur.toString() != "")
         {
            this.§1t2200s0§ = param1.ppblur;
         }
         if(param1.gblur.toString() != "")
         {
            this.§1t2201s0§ = param1.gblur;
         }
         if(param1.fgblur.toString() != "")
         {
            this.§1t2202s0§ = param1.fgblur;
         }
         if(param1.ffscroll.toString() != "")
         {
            this.§1t2203s0§ = param1.ffscroll;
         }
         if(param1.fscroll.toString() != "")
         {
            this.§1t2204s0§ = param1.fscroll;
         }
         if(param1.ppscroll.toString() != "")
         {
            this.§1t2205s0§ = param1.ppscroll;
         }
         if(param1.gscroll.toString() != "")
         {
            this.§1t2206s0§ = param1.gscroll;
         }
         if(param1.fgscroll.toString() != "")
         {
            this.§1t2207s0§ = param1.fgscroll;
         }
      }
      
      internal function §1t796s0§(param1:String) : String
      {
         return param1.substr(0,1) + param1.substr(1);
      }
   }
}

