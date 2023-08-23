workspace {

    model {
        adminstratorUser = person "AdminstratorUser" "Adminstrator User"{

        }

        eventParticipantUser = person "EventParticipantUser" "Event participant User"{

        }
        softwareSystem = softwareSystem "City Event Notification System" "Registration and notification of Events in the City" {
            adminstratorUser -> softwareSystem "manage"
            eventParticipantUser -> softwareSystem "uses"
            consoleapp = container "Console Application" {
                adminstratorUser -> consoleapp "manage"
                eventParticipantUser -> consoleapp "uses"
                
                auth = component "Auth" {
                    eventParticipantUser -> this "auth"
                    adminstratorUser -> this "auth"
                }
                
                user = component "User"{
                    properties {
                        username "String"
                        password "String"
                        email "String"
                        name "String"
                        
                    }
                    eventParticipantUser -> this "createUser"
                    eventParticipantUser -> this "loadUser"
                    eventParticipantUser -> this "updateUser"
                    
                }
                
                event = component "Event"{
                    adminstratorUser -> this "createEvent"
                    adminstratorUser -> this "updateEvent"
                    adminstratorUser -> this "loadEvent"
                    adminstratorUser -> this "deleteEvent"
                    eventParticipantUser -> this "registeInEvent"
                    
                    
                }
                category = component "Category"{
                    properties {
                        name "String"
                        
                    }
                    adminstratorUser -> this "createCategory"
                    adminstratorUser -> this "updateCategory"
                    adminstratorUser -> this "loadCategory"
                    adminstratorUser -> this "deleteCategory"
                } 
                notification = component "Notification"{
                    adminstratorUser -> this "createNotification"
                    adminstratorUser -> this "updateNotification"
                    adminstratorUser -> this "loadNotification"
                    adminstratorUser -> this "deleteNotification"
                    eventParticipantUser -> this "listenNotification"
                }
                
                city = component "City" "Porto Alegre" {
                    properties {
                        name "Porto Alegre"
                        uf "RS"
                    }
                    adminstratorUser -> this "Manage City"
                }
                
                event -> category "category"
                event -> city "city"
                event -> notification "notifications"
                event -> user "users"
                
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