// DA3F_macros.hpp

#define Cfg_sub(CLASS, SUBCLASS,TYPE, PROPS) TYPE(missionConfigFile >> CLASS >> SUBCLASS >> PROPS )
#define Cfg_class(CLASS,TYPE, PROPS) TYPE(missionConfigFile >> CLASS >> PROPS )
#define Cfg_ra(TYPE, PROPS) TYPE(missionConfigFile >> "RadioActive" >> PROPS )