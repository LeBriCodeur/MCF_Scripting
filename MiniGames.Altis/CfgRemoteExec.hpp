#define F(NAME,TARGET) class NAME { \
    allowedTargets = TARGET; \
};
#define JIP(NAME,TARGET) class NAME { \
    allowedTargets = TARGET; \
    jip = 1; \
};

#define ANYONE 0
#define CLIENT 1
#define SERVER 2

class CfgRemoteExec {
        class Functions {
            mode = 1;
            jip = 0;
        /* DA3F Mission */
            // F(DA3F_fnc_bla,CLIENT)
            // F(DA3F_fnc_bla,SERVER)
            // F(DA3F_fnc_bla,ANYONE)
        };

    class Commands {
        mode = 1;
        jip = 0;

        F(hint,ANYONE)
        F(systemChat,ANYONE)

    };
};