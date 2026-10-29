package
{
   public class SkillManager
   {
      
      public static var instance:SkillManager;
      
      public static var SKILL_LIGHTSTANCE:int = 1000;
      
      public static var SKILL_BALANCEDSTANCE:int = 1001;
      
      public static var SKILL_HEAVYSTANCE:int = 1002;
      
      public static var SKILL_JUMP:int = 1003;
      
      public static var SKILL_ROLL:int = 1004;
      
      public static var SKILL_FOCUS:int = 1005;
      
      public static var SKILL_SLASHWAVE:int = 1006;
      
      public static var SKILL_KUNAITHROW:int = 1007;
      
      public static var SKILL_SMOKEBOMB:int = 1010;
      
      public static var SKILL_SUBSTITUTIONLOG:int = 1012;
      
      public static var SKILL_FIREBREATH:int = 1013;
      
      public static var SKILL_TRAP:int = 1024;
      
      public static var SKILL_TRAPFIRE:int = 1025;
      
      public static var SKILL_TRAPWATER:int = 1026;
      
      public static var SKILL_TRAPWIND:int = 1027;
      
      public static var SKILL_TRAPEARTH:int = 1028;
      
      public static var SKILL_KUNAIFIRE:int = 1029;
      
      public static var SKILL_KUNAIWATER:int = 1030;
      
      public static var SKILL_KUNAIWIND:int = 1031;
      
      public static var SKILL_KUNAIEARTH:int = 1032;
      
      public static var SKILL_GROUNDPUNCH:int = 1033;
      
      public static var SKILL_WINDKICK:int = 1034;
      
      public static var SKILL_WATERSPLASH:int = 1035;
      
      public static var SKILL_SHUNPO:int = 1039;
      
      public static var SKILL_THOUSANDSTABS:int = 1040;
      
      public static var SKILL_DEADLYCLEAVE:int = 1041;
      
      public static var SKILL_CHIPUNCH:int = 1042;
      
      public static var SKILL_CHIKICK:int = 1043;
      
      public static var SKILL_SPIRITTHIEF:int = 1044;
      
      public static var SKILL_CHIBURST:int = 1045;
      
      public static var SKILL_CHARGEDSHOT:int = 1046;
      
      public static var SKILL_HEAVENLYSWORDS:int = 1047;
      
      public static var SKILL_DEATHTOUCH:int = 1048;
      
      public static var SKILL_DASHRIGHT:int = 1049;
      
      public static var SKILL_DASHLEFT:int = 1050;
      
      public static var SKILL_WINDMILL:int = 1051;
      
      public static var SKILL_FLASHBANG:int = 1052;
      
      public static var SKILL_SHADOWCLONE:int = 1053;
      
      public static var SKILL_STEALTH:int = 1054;
      
      public static var SKILL_MASSCLONE:int = 1055;
      
      public static var SKILL_BACKTHROW:int = 1064;
      
      public static var SKILL_AIRSTAB:int = 1065;
      
      public static var SKILL_BULLCHARGE:int = 1066;
      
      public static var SKILL_PUNCHLUNGE:int = 1067;
      
      public static var SKILL_UNDYING:int = 1068;
      
      public static var SKILL_CHICHARGE:int = 1069;
      
      public static var SKILL_INFERNO:int = 1070;
      
      public static var SKILL_TSUNAMI:int = 1071;
      
      public static var SKILL_TORNADO:int = 1072;
      
      public static var SKILL_EARTHQUAKE:int = 1073;
      
      public function SkillManager()
      {
         super();
         instance = this;
      }
      
      public static function getInstance() : SkillManager
      {
         if(instance == null)
         {
            instance = new SkillManager();
         }
         return instance;
      }
      
      internal function startSkill(skillid:int, skilllevel:int, owner:MCSPlayer, target:NPC = null, skillData:XMLSkill = null, xpos:int = -1, ypos:int = -1) : Boolean
      {
         var velX:int = 0;
         var startX:int = 0;
         var damage:int = 0;
         var projectileType:int = 0;
         var dashstate:int = 0;
         var dashstate2:int = 0;
         var trapProjectile:TrapProjectile = null;
         var chargingTime:int = 0;
         if(StageManager.isPeaceful() || owner.dead)
         {
            return false;
         }
         if(!(skillid == SKILL_SMOKEBOMB && skilllevel > 1) && !owner.canChangeStance() && !(owner.isCharging() && (skillid == SKILL_CHARGEDSHOT || skillid == SKILL_SHUNPO || skillid == SKILL_THOUSANDSTABS || skillid == SKILL_DEADLYCLEAVE)))
         {
            return false;
         }
         if(skillid == SKILL_SMOKEBOMB && skilllevel > 1 && !owner.canSmokeAway())
         {
            return false;
         }
         if(skillData == null)
         {
            skillData = QuestEngine.getSkillData(skillid);
         }
         if(skillid == SKILL_CHARGEDSHOT && !(xpos == 0 && ypos == 0) && owner.getChargingTime() == 0)
         {
            return false;
         }
         if((skillid == SKILL_SHADOWCLONE || skillid == SKILL_MASSCLONE) && GameEngine.isPvPRoomMode())
         {
            return false;
         }
         if(owner.isPlayer() && !owner.useChi(skillData.getChiCost(skilllevel)))
         {
            return false;
         }
         owner.cancelStealth();
         switch(skillid)
         {
            case SKILL_JUMP:
               owner.startAction(MCSActor.JUMP_STATE);
               if(NetworkManager.instance.isP2P() && (owner.isPlayer() || owner.isPlayerAI()))
               {
                  NetworkManager.instance.startAction(MCSActor.JUMP_STATE,owner.getMapPosition(),owner.getMCS().y,owner.getMCS().isFacingRight());
               }
               break;
            case SKILL_ROLL:
               owner.startAction(MCSActor.FORWARDROLL_STATE);
               if(NetworkManager.instance.isP2P() && (owner.isPlayer() || owner.isPlayerAI()))
               {
                  NetworkManager.instance.startAction(MCSActor.FORWARDROLL_STATE,owner.getMapPosition(),owner.getMCS().y,owner.getMCS().isFacingRight());
               }
               break;
            case SKILL_DASHRIGHT:
               dashstate = MCSActor.DASH_STATE;
               if(xpos == -1)
               {
                  xpos = owner.getMapPosition() + 1;
               }
               else
               {
                  xpos += StageManager.getStagePosition();
               }
               if(xpos < owner.getMapPosition() && owner.getMCS().isFacingRight() || xpos > owner.getMapPosition() && !owner.getMCS().isFacingRight())
               {
                  dashstate = MCSActor.BACKSTEP_STATE;
               }
               owner.startAction(dashstate);
               if(NetworkManager.instance.isP2P() && (owner.isPlayer() || owner.isPlayerAI()))
               {
                  NetworkManager.instance.startAction(dashstate,owner.getMapPosition(),owner.getMCS().y,owner.getMCS().isFacingRight());
               }
               break;
            case SKILL_DASHLEFT:
               dashstate2 = MCSActor.DASH_STATE;
               if(xpos == -1)
               {
                  xpos = owner.getMapPosition() - 1;
               }
               else
               {
                  xpos += StageManager.getStagePosition();
               }
               if(xpos < owner.getMapPosition() && owner.getMCS().isFacingRight() || xpos > owner.getMapPosition() && !owner.getMCS().isFacingRight())
               {
                  dashstate2 = MCSActor.BACKSTEP_STATE;
               }
               owner.startAction(dashstate2);
               if(NetworkManager.instance.isP2P() && (owner.isPlayer() || owner.isPlayerAI()))
               {
                  NetworkManager.instance.startAction(dashstate2,owner.getMapPosition(),owner.getMCS().y,owner.getMCS().isFacingRight());
               }
               break;
            case SKILL_FOCUS:
               owner.reload = owner.maxreload - 1;
               owner.startAction(MCSActor.DOSKILL_STATE);
               owner.startAnim(MCSActor.FOCUS_START);
               if(NetworkManager.instance.isP2P() && (owner.isPlayer() || owner.isPlayerAI()))
               {
                  NetworkManager.instance.startAction(MCSActor.DOSKILL_STATE,owner.getMapPosition(),owner.getMCS().y,owner.getMCS().isFacingRight(),MCSActor.FOCUS_START);
               }
               break;
            case SKILL_SLASHWAVE:
               owner.startAction(MCSActor.DOSKILL_STATE);
               owner.startAnim(MCSActor.KATANAATTACK);
               if(owner.getMCS().isFacingRight())
               {
                  startX = owner.getMapPosition() + 20;
                  velX = 10;
               }
               else
               {
                  startX = owner.getMapPosition() - 20;
                  velX = -10;
               }
               ProjectileManager.createProjectile(2,startX,owner.getMCS().y,velX,0,owner.STAT_ATK,skilllevel,owner);
               if(NetworkManager.instance.isP2P() && (owner.isPlayer() || owner.isPlayerAI()))
               {
                  NetworkManager.instance.startAction(MCSActor.DOSKILL_STATE,owner.getMapPosition(),owner.getMCS().y,owner.getMCS().isFacingRight(),MCSActor.KATANAATTACK);
                  NetworkManager.instance.createDuelProjectile(2,startX,owner.getMCS().y,velX,0,owner.STAT_ATK,skilllevel);
               }
               break;
            case SKILL_KUNAITHROW:
            case SKILL_KUNAIFIRE:
            case SKILL_KUNAIWATER:
            case SKILL_KUNAIWIND:
            case SKILL_KUNAIEARTH:
               if(owner.isPlayer())
               {
                  if(StatsManager.getStat(2501) == 0)
                  {
                     trace("no ammo");
                     return false;
                  }
                  StatsManager.changeStat(2501,-1);
               }
               owner.startAction(MCSActor.DOSKILL_STATE);
               owner.startAnim(MCSActor.KUNAITHROW);
               if(owner.getMCS().isFacingRight())
               {
                  startX = owner.getMapPosition() + 20;
                  velX = 20;
               }
               else
               {
                  startX = owner.getMapPosition() - 20;
                  velX = -20;
               }
               if(skillid == SKILL_KUNAITHROW)
               {
                  damage = owner.STAT_ATK;
                  projectileType = ProjectileManager.PROJ_KUNAI;
               }
               else if(skillid == SKILL_KUNAIFIRE)
               {
                  damage = owner.STAT_FIREATK;
                  projectileType = ProjectileManager.PROJ_KUNAIFIRE;
               }
               else if(skillid == SKILL_KUNAIWATER)
               {
                  damage = owner.STAT_WATERATK;
                  projectileType = ProjectileManager.PROJ_KUNAIWATER;
               }
               else if(skillid == SKILL_KUNAIWIND)
               {
                  damage = owner.STAT_WINDATK;
                  projectileType = ProjectileManager.PROJ_KUNAIWIND;
               }
               else if(skillid == SKILL_KUNAIEARTH)
               {
                  damage = owner.STAT_EARTHATK;
                  projectileType = ProjectileManager.PROJ_KUNAIEARTH;
               }
               ProjectileManager.createProjectile(projectileType,startX,owner.getMCS().y - 50,velX,0,damage,skilllevel,owner);
               if(NetworkManager.instance.isP2P() && (owner.isPlayer() || owner.isPlayerAI()))
               {
                  NetworkManager.instance.startAction(MCSActor.DOSKILL_STATE,owner.getMapPosition(),owner.getMCS().y,owner.getMCS().isFacingRight(),MCSActor.KUNAITHROW);
                  NetworkManager.instance.createDuelProjectile(projectileType,startX,owner.getMCS().y - 50,velX,0,damage,skilllevel);
               }
               break;
            case SKILL_WINDMILL:
               if(owner.isPlayer())
               {
                  if(StatsManager.getStat(2501) < 4)
                  {
                     trace("no ammo");
                     return false;
                  }
                  StatsManager.changeStat(2501,-4);
               }
               owner.startAction(MCSActor.DOSKILL_STATE);
               owner.startAnim(MCSActor.KUNAITHROW);
               if(owner.getMCS().isFacingRight())
               {
                  startX = owner.getMapPosition() + 20;
                  velX = 20;
               }
               else
               {
                  startX = owner.getMapPosition() - 20;
                  velX = -20;
               }
               ProjectileManager.createProjectile(ProjectileManager.PROJ_WINDMILL,startX,owner.getMCS().y - 50,velX,0,0,skilllevel,owner);
               if(NetworkManager.instance.isP2P() && (owner.isPlayer() || owner.isPlayerAI()))
               {
                  NetworkManager.instance.startAction(MCSActor.DOSKILL_STATE,owner.getMapPosition(),owner.getMCS().y,owner.getMCS().isFacingRight(),MCSActor.KUNAITHROW);
                  NetworkManager.instance.createDuelProjectile(ProjectileManager.PROJ_WINDMILL,startX,owner.getMCS().y - 50,velX,0,0,skilllevel);
               }
               break;
            case SKILL_SMOKEBOMB:
               if(skilllevel == 1)
               {
                  owner.startAction(MCSActor.SMOKEBOMB_STATE);
                  if(NetworkManager.instance.isP2P() && (owner.isPlayer() || owner.isPlayerAI()))
                  {
                     NetworkManager.instance.startAction(MCSActor.SMOKEBOMB_STATE,owner.getMapPosition(),owner.getMCS().y,owner.getMCS().isFacingRight());
                  }
               }
               else
               {
                  if(NetworkManager.instance.isP2P() && (owner.isPlayer() || owner.isPlayerAI()))
                  {
                     NetworkManager.instance.startAction(MCSActor.SMOKEBOMB2_STATE,owner.getMapPosition(),owner.getMCS().y,owner.getMCS().isFacingRight());
                  }
                  owner.startAction(MCSActor.SMOKEBOMB2_STATE);
               }
               break;
            case SKILL_FLASHBANG:
               owner.startAction(MCSActor.SKILL_FLASHBANG_STATE);
               if(NetworkManager.instance.isP2P() && (owner.isPlayer() || owner.isPlayerAI()))
               {
                  NetworkManager.instance.startAction(MCSActor.SKILL_FLASHBANG_STATE,owner.getMapPosition(),owner.getMCS().y,owner.getMCS().isFacingRight());
               }
               break;
            case SKILL_STEALTH:
               owner.startAction(MCSActor.SKILL_STEALTH_STATE);
               if(NetworkManager.instance.isP2P() && (owner.isPlayer() || owner.isPlayerAI()))
               {
                  NetworkManager.instance.startAction(MCSActor.SKILL_STEALTH_STATE,owner.getMapPosition(),owner.getMCS().y,owner.getMCS().isFacingRight());
               }
               break;
            case SKILL_SHADOWCLONE:
               if(NetworkManager.instance.isP2P() && (owner.isPlayer() || owner.isPlayerAI()))
               {
                  NetworkManager.instance.startAction(MCSActor.SKILL_SHADOWCLONE_STATE,owner.getMapPosition(),owner.getMCS().y,owner.getMCS().isFacingRight(),owner.cloneIndex.toString());
               }
               owner.startAction(MCSActor.SKILL_SHADOWCLONE_STATE);
               break;
            case SKILL_MASSCLONE:
               if(NetworkManager.instance.isP2P() && (owner.isPlayer() || owner.isPlayerAI()))
               {
                  NetworkManager.instance.startAction(MCSActor.SKILL_MASSCLONE_STATE,owner.getMapPosition(),owner.getMCS().y,owner.getMCS().isFacingRight(),owner.cloneIndex.toString());
               }
               owner.startAction(MCSActor.SKILL_MASSCLONE_STATE);
               break;
            case SKILL_SUBSTITUTIONLOG:
               owner.startAction(MCSActor.SKILL_SUBSTITUTIONLOG_STATE);
               if(NetworkManager.instance.isP2P() && (owner.isPlayer() || owner.isPlayerAI()))
               {
                  NetworkManager.instance.startAction(MCSActor.SKILL_SUBSTITUTIONLOG_STATE,owner.getMapPosition(),owner.getMCS().y,owner.getMCS().isFacingRight());
               }
               break;
            case SKILL_FIREBREATH:
               owner.startAction(MCSActor.SKILL_FIREBREATH_STATE);
               owner.startAnim(MCSActor.JUTSU_BLOW_PARTA);
               if(NetworkManager.instance.isP2P() && (owner.isPlayer() || owner.isPlayerAI()))
               {
                  NetworkManager.instance.startAction(MCSActor.SKILL_FIREBREATH_STATE,owner.getMapPosition(),owner.getMCS().y,owner.getMCS().isFacingRight(),MCSActor.JUTSU_BLOW_PARTA);
               }
               break;
            case SKILL_GROUNDPUNCH:
               owner.startAction(MCSActor.SKILL_GROUNDPUNCH_STATE);
               owner.startAnim(MCSActor.GROUNDPUNCH_PARTA);
               if(NetworkManager.instance.isP2P() && (owner.isPlayer() || owner.isPlayerAI()))
               {
                  NetworkManager.instance.startAction(MCSActor.SKILL_GROUNDPUNCH_STATE,owner.getMapPosition(),owner.getMCS().y,owner.getMCS().isFacingRight(),MCSActor.GROUNDPUNCH_PARTA);
               }
               break;
            case SKILL_WINDKICK:
               owner.startAction(MCSActor.WINDKICK_STATE);
               owner.startAnim(MCSActor.PUNCHCOMBO_PARTA);
               if(NetworkManager.instance.isP2P() && (owner.isPlayer() || owner.isPlayerAI()))
               {
                  NetworkManager.instance.startAction(MCSActor.WINDKICK_STATE,owner.getMapPosition(),owner.getMCS().y,owner.getMCS().isFacingRight(),MCSActor.PUNCHCOMBO_PARTA);
               }
               break;
            case SKILL_WATERSPLASH:
               owner.startAction(MCSActor.SKILL_WATERSPLASH_STATE);
               owner.startAnim(MCSActor.STOMP_PARTA);
               if(NetworkManager.instance.isP2P() && (owner.isPlayer() || owner.isPlayerAI()))
               {
                  NetworkManager.instance.startAction(MCSActor.SKILL_WATERSPLASH_STATE,owner.getMapPosition(),owner.getMCS().y,owner.getMCS().isFacingRight(),MCSActor.STOMP_PARTA);
               }
               break;
            case SKILL_INFERNO:
               owner.startAction(MCSActor.SKILL_INFERNO_STATE);
               owner.startAnim(MCSActor.JUTSU_BLOW_PARTA);
               if(NetworkManager.instance.isP2P() && (owner.isPlayer() || owner.isPlayerAI()))
               {
                  NetworkManager.instance.startAction(MCSActor.SKILL_INFERNO_STATE,owner.getMapPosition(),owner.getMCS().y,owner.getMCS().isFacingRight(),MCSActor.JUTSU_BLOW_PARTA);
               }
               break;
            case SKILL_EARTHQUAKE:
               owner.startAction(MCSActor.SKILL_EARTHQUAKE_STATE);
               owner.startAnim(MCSActor.JUTSU_GROUND_PARTA);
               if(NetworkManager.instance.isP2P() && (owner.isPlayer() || owner.isPlayerAI()))
               {
                  NetworkManager.instance.startAction(MCSActor.SKILL_EARTHQUAKE_STATE,owner.getMapPosition(),owner.getMCS().y,owner.getMCS().isFacingRight(),MCSActor.JUTSU_GROUND_PARTA);
               }
               break;
            case SKILL_TORNADO:
               owner.startAction(MCSActor.SKILL_TORNADO_STATE);
               owner.startAnim(MCSActor.JUTSU_GROUND_PARTA);
               if(NetworkManager.instance.isP2P() && (owner.isPlayer() || owner.isPlayerAI()))
               {
                  NetworkManager.instance.startAction(MCSActor.SKILL_TORNADO_STATE,owner.getMapPosition(),owner.getMCS().y,owner.getMCS().isFacingRight(),MCSActor.JUTSU_GROUND_PARTA);
               }
               break;
            case SKILL_TSUNAMI:
               owner.startAction(MCSActor.SKILL_TSUNAMI_STATE);
               owner.startAnim(MCSActor.JUTSU_GROUND_PARTA);
               if(NetworkManager.instance.isP2P() && (owner.isPlayer() || owner.isPlayerAI()))
               {
                  NetworkManager.instance.startAction(MCSActor.SKILL_TSUNAMI_STATE,owner.getMapPosition(),owner.getMCS().y,owner.getMCS().isFacingRight(),MCSActor.JUTSU_GROUND_PARTA);
               }
               break;
            case SKILL_AIRSTAB:
               owner.startAction(MCSActor.DOSKILL_STATE);
               owner.startAnim(MCSActor.AIRSTAB_START);
               if(NetworkManager.instance.isP2P() && (owner.isPlayer() || owner.isPlayerAI()))
               {
                  NetworkManager.instance.startAction(MCSActor.DOSKILL_STATE,owner.getMapPosition(),owner.getMCS().y,owner.getMCS().isFacingRight(),MCSActor.AIRSTAB_START);
               }
               break;
            case SKILL_CHICHARGE:
               owner.startAction(MCSActor.SKILL_CHICHARGE_STATE);
               owner.startAnim(MCSActor.CHICHARGE_START);
               if(NetworkManager.instance.isP2P() && (owner.isPlayer() || owner.isPlayerAI()))
               {
                  NetworkManager.instance.startAction(MCSActor.SKILL_CHICHARGE_STATE,owner.getMapPosition(),owner.getMCS().y,owner.getMCS().isFacingRight(),MCSActor.CHICHARGE_START);
               }
               break;
            case SKILL_TRAP:
            case SKILL_TRAPFIRE:
            case SKILL_TRAPWATER:
            case SKILL_TRAPWIND:
            case SKILL_TRAPEARTH:
               if(owner.isPlayer())
               {
                  if(StatsManager.getStat(2501) == 0)
                  {
                     trace("no ammo");
                     return false;
                  }
                  StatsManager.changeStat(2501,-1);
               }
               owner.startAction(MCSActor.LAYTRAP_STATE);
               owner.startAnim(MCSActor.PICKUP);
               if(owner.getMCS().isFacingRight())
               {
                  startX = owner.getMapPosition() + 50;
               }
               else
               {
                  startX = owner.getMapPosition() - 50;
               }
               if(skillid == SKILL_TRAP)
               {
                  damage = owner.STAT_ATK;
                  projectileType = ProjectileManager.PROJ_TRAP;
               }
               else if(skillid == SKILL_TRAPFIRE)
               {
                  damage = owner.STAT_FIREATK;
                  projectileType = ProjectileManager.PROJ_TRAPFIRE;
               }
               else if(skillid == SKILL_TRAPWATER)
               {
                  damage = owner.STAT_WATERATK;
                  projectileType = ProjectileManager.PROJ_TRAPWATER;
               }
               else if(skillid == SKILL_TRAPWIND)
               {
                  damage = owner.STAT_WINDATK;
                  projectileType = ProjectileManager.PROJ_TRAPWIND;
               }
               else if(skillid == SKILL_TRAPEARTH)
               {
                  damage = owner.STAT_EARTHATK;
                  projectileType = ProjectileManager.PROJ_TRAPEARTH;
               }
               trapProjectile = ProjectileManager.createProjectile(projectileType,startX,owner.getMCS().y,0,0,damage,skilllevel,owner) as TrapProjectile;
               if(!owner.isPlayer())
               {
                  trapProjectile.setNPCMode();
               }
               if(NetworkManager.instance.isP2P() && (owner.isPlayer() || owner.isPlayerAI()))
               {
                  NetworkManager.instance.startAction(MCSActor.LAYTRAP_STATE,owner.getMapPosition(),owner.getMCS().y,owner.getMCS().isFacingRight(),MCSActor.PICKUP);
               }
               break;
            case SKILL_CHIPUNCH:
               owner.startAnim(MCSActor.PUNCH_START);
               owner.startAction(MCSActor.DOSKILL_STATE);
               if(NetworkManager.instance.isP2P() && (owner.isPlayer() || owner.isPlayerAI()))
               {
                  NetworkManager.instance.startAction(MCSActor.DOSKILL_STATE,owner.getMapPosition(),owner.getMCS().y,owner.getMCS().isFacingRight(),MCSActor.PUNCH_START);
               }
               break;
            case SKILL_CHIKICK:
               owner.startAnim(MCSActor.SPARTAKICK_START);
               owner.startAction(MCSActor.DOSKILL_STATE);
               if(NetworkManager.instance.isP2P() && (owner.isPlayer() || owner.isPlayerAI()))
               {
                  NetworkManager.instance.startAction(MCSActor.DOSKILL_STATE,owner.getMapPosition(),owner.getMCS().y,owner.getMCS().isFacingRight(),MCSActor.SPARTAKICK_START);
               }
               break;
            case SKILL_SPIRITTHIEF:
               owner.startAction(MCSActor.SKILL_SPIRITTHIEF_STATE);
               owner.startAnim(MCSActor.KNEEGROIN);
               if(NetworkManager.instance.isP2P() && (owner.isPlayer() || owner.isPlayerAI()))
               {
                  NetworkManager.instance.startAction(MCSActor.DOSKILL_STATE,owner.getMapPosition(),owner.getMCS().y,owner.getMCS().isFacingRight(),MCSActor.KNEEGROIN);
               }
               break;
            case SKILL_BACKTHROW:
               owner.startAction(MCSActor.SKILL_BACKTHROW_STATE);
               owner.startAnim(MCSActor.BACKTHROW);
               if(NetworkManager.instance.isP2P() && (owner.isPlayer() || owner.isPlayerAI()))
               {
                  NetworkManager.instance.startAction(MCSActor.DOSKILL_STATE,owner.getMapPosition(),owner.getMCS().y,owner.getMCS().isFacingRight(),MCSActor.BACKTHROW);
               }
               break;
            case SKILL_CHIBURST:
               owner.startAction(MCSActor.SKILL_CHIBURST_STATE);
               owner.startAnim(MCSActor.GROUNDPUNCH_PARTA);
               if(NetworkManager.instance.isP2P() && (owner.isPlayer() || owner.isPlayerAI()))
               {
                  NetworkManager.instance.startAction(MCSActor.SKILL_CHIBURST_STATE,owner.getMapPosition(),owner.getMCS().y,owner.getMCS().isFacingRight(),MCSActor.GROUNDPUNCH_PARTA);
               }
               break;
            case SKILL_SHUNPO:
               if(xpos == 0 && ypos == 0)
               {
                  owner.startAction(MCSActor.SKILL_SHUNPO_STATE);
                  owner.startAnim(MCSActor.SHUNPO_START);
                  if(NetworkManager.instance.isP2P() && (owner.isPlayer() || owner.isPlayerAI()))
                  {
                     NetworkManager.instance.startAction(MCSActor.SKILL_SHUNPO_STATE,owner.getMapPosition(),owner.getMCS().y,owner.getMCS().isFacingRight(),MCSActor.SHUNPO_START);
                  }
               }
               else
               {
                  owner.startAnim(MCSActor.SHUNPO_END);
                  if(NetworkManager.instance.isP2P() && (owner.isPlayer() || owner.isPlayerAI()))
                  {
                     NetworkManager.instance.startAction(MCSActor.DOSKILL_STATE,owner.getMapPosition(),owner.getMCS().y,owner.getMCS().isFacingRight(),MCSActor.SHUNPO_END);
                  }
                  owner.startAction(MCSActor.DOSKILL_STATE);
               }
               break;
            case SKILL_THOUSANDSTABS:
               if(xpos == 0 && ypos == 0)
               {
                  owner.startAction(MCSActor.SKILL_THOUSANDSTABS_STATE);
                  owner.startAnim(MCSActor.FLURRY_PARTA);
                  if(NetworkManager.instance.isP2P() && (owner.isPlayer() || owner.isPlayerAI()))
                  {
                     NetworkManager.instance.startAction(MCSActor.SKILL_THOUSANDSTABS_STATE,owner.getMapPosition(),owner.getMCS().y,owner.getMCS().isFacingRight(),MCSActor.FLURRY_PARTA);
                  }
               }
               else
               {
                  owner.startAction(MCSActor.DOSKILL_STATE);
                  owner.startAnim(MCSActor.FLURRY_PARTB);
                  if(NetworkManager.instance.isP2P() && (owner.isPlayer() || owner.isPlayerAI()))
                  {
                     NetworkManager.instance.startAction(MCSActor.DOSKILL_STATE,owner.getMapPosition(),owner.getMCS().y,owner.getMCS().isFacingRight(),MCSActor.FLURRY_PARTB);
                  }
               }
               break;
            case SKILL_DEADLYCLEAVE:
               if(xpos == 0 && ypos == 0)
               {
                  owner.startAction(MCSActor.SKILL_DEADLYCLEAVE_STATE);
                  owner.startAnim(MCSActor.CLEAVE_START);
                  if(NetworkManager.instance.isP2P() && (owner.isPlayer() || owner.isPlayerAI()))
                  {
                     NetworkManager.instance.startAction(MCSActor.SKILL_DEADLYCLEAVE_STATE,owner.getMapPosition(),owner.getMCS().y,owner.getMCS().isFacingRight(),MCSActor.CLEAVE_START);
                  }
               }
               else
               {
                  owner.startAction(MCSActor.DOSKILL_STATE);
                  owner.startAnim(MCSActor.CLEAVE_END);
                  if(NetworkManager.instance.isP2P() && (owner.isPlayer() || owner.isPlayerAI()))
                  {
                     NetworkManager.instance.startAction(MCSActor.DOSKILL_STATE,owner.getMapPosition(),owner.getMCS().y,owner.getMCS().isFacingRight(),MCSActor.CLEAVE_END);
                  }
               }
               break;
            case SKILL_CHARGEDSHOT:
               if(xpos == 0 && ypos == 0)
               {
                  owner.startAction(MCSActor.CHARGING_STATE);
                  owner.startAnim(MCSActor.CHARGEDSHOT_START);
                  if(NetworkManager.instance.isP2P() && (owner.isPlayer() || owner.isPlayerAI()))
                  {
                     NetworkManager.instance.startAction(MCSActor.CHARGING_STATE,owner.getMapPosition(),owner.getMCS().y,owner.getMCS().isFacingRight(),MCSActor.CHARGEDSHOT_START);
                  }
               }
               else
               {
                  chargingTime = owner.getChargingTime();
                  owner.startAction(MCSActor.DOSKILL_STATE);
                  owner.startAnim(MCSActor.CHARGEDSHOT_END);
                  if(owner.getMCS().isFacingRight())
                  {
                     startX = owner.getMapPosition() + 25;
                     velX = 10;
                  }
                  else
                  {
                     startX = owner.getMapPosition() - 25;
                     velX = -10;
                  }
                  ProjectileManager.createProjectile(ProjectileManager.PROJ_CHARGEDSHOT,startX,owner.getMCS().y - 50,velX,0,chargingTime,skilllevel,owner);
                  if(NetworkManager.instance.isP2P() && (owner.isPlayer() || owner.isPlayerAI()))
                  {
                     NetworkManager.instance.startAction(MCSActor.DOSKILL_STATE,owner.getMapPosition(),owner.getMCS().y,owner.getMCS().isFacingRight(),MCSActor.CHARGEDSHOT_END);
                     NetworkManager.instance.createDuelProjectile(ProjectileManager.PROJ_CHARGEDSHOT,startX,owner.getMCS().y - 50,velX,0,chargingTime,skilllevel);
                  }
                  owner.cancelChargingTime();
               }
               break;
            case SKILL_HEAVENLYSWORDS:
               owner.startAction(MCSActor.SKILL_HEAVENLYSWORDS_STATE);
               owner.startAnim(MCSActor.JUTSU_GROUND_PARTA);
               if(xpos != -1)
               {
                  startX = xpos + StageManager.getStagePosition();
               }
               else if(owner.getMCS().isFacingRight())
               {
                  startX = owner.getMapPosition() + 40;
               }
               else
               {
                  startX = owner.getMapPosition() - 40;
               }
               ProjectileManager.createProjectile(ProjectileManager.PROJ_HEAVENLYSWORD,startX,StageManager.getGroundY(),0,0,0,skilllevel,owner);
               if(NetworkManager.instance.isP2P() && (owner.isPlayer() || owner.isPlayerAI()))
               {
                  NetworkManager.instance.startAction(MCSActor.SKILL_HEAVENLYSWORDS_STATE,owner.getMapPosition(),owner.getMCS().y,owner.getMCS().isFacingRight(),MCSActor.JUTSU_GROUND_PARTA);
                  NetworkManager.instance.createDuelProjectile(ProjectileManager.PROJ_HEAVENLYSWORD,startX,StageManager.getGroundY(),0,0,0,skilllevel);
               }
               break;
            case SKILL_DEATHTOUCH:
               owner.startAction(MCSActor.SKILL_DEATHTOUCH_STATE);
               owner.startAnim(MCSActor.DEATHTOUCH_PARTA);
               if(NetworkManager.instance.isP2P() && (owner.isPlayer() || owner.isPlayerAI()))
               {
                  NetworkManager.instance.startAction(MCSActor.SKILL_DEATHTOUCH_STATE,owner.getMapPosition(),owner.getMCS().y,owner.getMCS().isFacingRight(),MCSActor.DEATHTOUCH_PARTA);
               }
               break;
            case SKILL_BULLCHARGE:
               owner.startAction(MCSActor.SKILL_BULLCHARGE_STATE);
               if(NetworkManager.instance.isP2P() && (owner.isPlayer() || owner.isPlayerAI()))
               {
                  NetworkManager.instance.startAction(MCSActor.SKILL_BULLCHARGE_STATE,owner.getMapPosition(),owner.getMCS().y,owner.getMCS().isFacingRight());
               }
               break;
            case SKILL_PUNCHLUNGE:
               owner.startAction(MCSActor.DOSKILL_STATE);
               owner.startAnim(MCSActor.PUNCHLUNGE_START);
               if(NetworkManager.instance.isP2P() && (owner.isPlayer() || owner.isPlayerAI()))
               {
                  NetworkManager.instance.startAction(MCSActor.DOSKILL_STATE,owner.getMapPosition(),owner.getMCS().y,owner.getMCS().isFacingRight(),MCSActor.PUNCHLUNGE_START);
               }
         }
         BattleUI.instance.checkSkillDisabled();
         return true;
      }
   }
}

