workspace {

    model {
        userAdminstrator = person "UserAdminstrator" "Adminstrator User"{

        }

        eventParticipantUser = person "EventParticipantUser" "Event participant User"{

        }
        softwareSystem = softwareSystem "City Event Notification System" "Registration and notification of Events in the City" {
        
            consoleapp = container "Console Application" {
                user = component "User"{
                    eventParticipantUser -> this "EventParticipantUser"
                }
                event = component "Event"{
                    userAdminstrator -> this "UserAdminstrator"
                }
                category = component "Category"{
                    userAdminstrator -> this "UserAdminstrator"
                } 
                notification = component "Notification"{
                    userAdminstrator -> this "UserAdminstrator"
                }
                
                city = component "City" "Porto Alegre" {
                    properties {
                        name "Porto Alegre"
                    }
                    userAdminstrator -> this "UserAdminstrator"
                }

            }
            
            database = container "Database" {
                consoleapp -> this "Reads from and writes to"
            }
        }


    }

    views {
        systemContext softwareSystem {
            include *
            autolayout lr
        }

        container softwareSystem {
            include *
            autolayout lr
        }
        
        component consoleapp {
            include *
            autolayout lr
        }
        
        theme default
  
    }
    
}