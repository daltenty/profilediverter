//
// Created by dtenty on 20/09/17.
//

#ifndef PROFILEDIVERTER_DIVERSIONSERVICE_H
#define PROFILEDIVERTER_DIVERSIONSERVICE_H

#include <unistd.h>

class DiversionService {
public:
    void install() {

    }

    bool isInstalled() {
        if( access( "~/.config/systemd/user/profile-offload.service", F_OK ) != -1 ) {
            return true;
        } else {
            return false;
        }
    }
};


#endif //PROFILEDIVERTER_DIVERSIONSERVICE_H
