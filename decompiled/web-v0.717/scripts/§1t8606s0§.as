package
{
   [Embed(source="/_assets/assets.swf", symbol="symbol3063")]
   public class §1t8606s0§ extends §1t399s0§
   {
      
      internal var itemtype:int;
      
      public function §1t8606s0§(param1:String, param2:String)
      {
         super();
         objectName = param2;
         if(param1 == "")
         {
            gotoAndStop(1);
         }
         else
         {
            gotoAndStop(int(param1));
         }
         this.itemtype = int(param1);
         §1t8503s0§ = §1t407s0§.§1t12444s0§;
      }
      
      override public function interact() : *
      {
         if(!§1t1523s0§.§1t9606s0§(1))
         {
            §1t406s0§.instance.§1t6528s0§(§1t1521s0§.getString(100),§1t1521s0§.getString(5));
            return;
         }
         visible = false;
         §1t8501s0§ = false;
         §1t1523s0§.§1t9586s0§().§1t4453s0§(false);
         §1t1523s0§.§1t9586s0§().§1t1557s0§(§1t1544s0§.§1t10329s0§);
         §1t1525s0§.§1t9927s0§(objectName);
         if(this.itemtype == 20)
         {
            §1t1523s0§.§1t9665s0§();
            §1t406s0§.instance.§1t6440s0§.§1t6344s0§();
            §1t406s0§.instance.§1t6578s0§();
         }
         else if(this.itemtype == 30)
         {
            §1t1523s0§.§1t9622s0§(20007);
            §1t123s0§.instance.§1t1596s0§();
            §1t3317s0§.instance.§1t1946s0§();
         }
      }
      
      override public function §1t6733s0§() : String
      {
         if(this.itemtype < 11)
         {
            return §1t1521s0§.getString(405);
         }
         if(this.itemtype == 20)
         {
            return §1t1521s0§.getString(424);
         }
         if(this.itemtype == 30)
         {
            return §1t1521s0§.getString(676);
         }
         return §1t1521s0§.getString(406);
      }
      
      override public function §1t8517s0§() : int
      {
         return 1;
      }
   }
}

