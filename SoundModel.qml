import QtQuick 2.12

ListModel {
    id: soundListModel
    ListElement {
        categoryTitle: qsTr("Appliances")
        categoryColor: "darkmagenta"
        contents: [
            /*ListElement {
                name: qsTr("Clock")
                colorCode: "darkmagenta"
                sound: "qrc:/sounds/computers.wav"
                image: "qrc:/icons/ic_alarm_24px.svg"
            },
            ListElement {
                name: qsTr("Computer")
                colorCode: "darkmagenta"
                sound: "qrc:/sounds/selected.wav"
                image: "qrc:/icons/ic_computer_24px.svg"
            },
            ListElement {
                name: qsTr("Fan")
                colorCode: "darkmagenta"
                sound: "qrc:/sounds/welcome.wav"
                image: "qrc:/icons/ic_toys_24px.svg"
            },*/
            ListElement {
                name: qsTr("Hair dryer")
                colorCode: "darkmagenta"
                sound: "qrc:/sounds/hairdryer.wav"
                image: "qrc:/icons/ic_hairdryer_24px.svg"
            },
            ListElement {
                name: qsTr("Hair dryer 2")
                colorCode: "darkmagenta"
                sound: "qrc:/sounds/hairdryer2.wav"
                image: "qrc:/icons/ic_hairdryer_24px.svg"
            },
            ListElement {
                name: qsTr("Hair dryer 3")
                colorCode: "darkmagenta"
                sound: "qrc:/sounds/hairdryer3.wav"
                image: "qrc:/icons/ic_hairdryer_24px.svg"
            },
            ListElement {
                name: qsTr("Microwave")
                colorCode: "darkmagenta"
                sound: "qrc:/sounds/microwave.wav"
                image: "qrc:/icons/ic_scanner_24px.svg"
            },
            ListElement {
                name: qsTr("Microwave 2")
                colorCode: "darkmagenta"
                sound: "qrc:/sounds/microwave2.wav"
                image: "qrc:/icons/ic_scanner_24px.svg"
            },
            /*ListElement {
                name: qsTr("Quiet Tv")
                colorCode: "darkmagenta"
                sound: "qrc:/sounds/selected.wav"
                image: "qrc:/icons/ic_tv_24px.svg"
            },*/
            ListElement {
                name: qsTr("Dishwasher")
                colorCode: "darkmagenta"
                sound: "qrc:/sounds/dishwasher.wav"
                image: "qrc:/icons/ic_kitchen_24px.svg"
            },/*
            ListElement {
                name: qsTr("Radio")
                colorCode: "darkmagenta"
                sound: "qrc:/sounds/welcome.wav"
                image: "qrc:/icons/ic_radio_24px.svg"
            },
            ListElement {
                name: qsTr("Vacuum cleaner")
                colorCode: "darkmagenta"
                sound: "qrc:/sounds/selected.wav"
                image: "qrc:/icons/ic_vacuumcleaner_24px.svg"
            },*/
            ListElement {
                name: qsTr("Washing machine")
                colorCode: "darkmagenta"
                sound: "qrc:/sounds/washingmachine.wav"
                image: "qrc:/icons/ic_local_laundry_service_24px.svg"
            },
            ListElement {
                name: qsTr("Shaver")
                colorCode: "darkmagenta"
                sound: "qrc:/sounds/shaver.wav"
                image: "qrc:/icons/ic_radio_24px.svg"
            }/*,
            ListElement {
                name: qsTr("White noise")
                colorCode: "darkmagenta"
                sound: "qrc:/sounds/enter.wav"
                image: "qrc:/icons/ic_tv_24px.svg"
            }*/
        ]
    }
    ListElement {
        categoryTitle: qsTr("Nature")
        categoryColor: "darkcyan"
        contents: [
            ListElement {
                name: qsTr("Heart beat")
                colorCode: "darkcyan"
                sound: "qrc:/sounds/heart.wav"
                image: "qrc:/icons/ic_heart_24px.svg"
            },
            ListElement {
                name: qsTr("Heart beat 2")
                colorCode: "darkcyan"
                sound: "qrc:/sounds/heart2.wav"
                image: "qrc:/icons/ic_heart_24px.svg"
            },
            ListElement {
                name: qsTr("Fire")
                colorCode: "darkcyan"
                sound: "qrc:/sounds/fire.wav"
                image: "qrc:/icons/ic_fire_24px.svg"
            },
            ListElement {
                name: qsTr("Forest")
                colorCode: "darkcyan"
                sound: "qrc:/sounds/forest.wav"
                image: "qrc:/icons/ic_local_florist_24px.svg"
            },
            ListElement {
                name: qsTr("Rain")
                colorCode: "darkcyan"
                sound: "qrc:/sounds/rain.wav"
                image: "qrc:/icons/ic_wb_cloudy_24px.svg"
            },
            ListElement {
                name: qsTr("Rain 2")
                colorCode: "darkcyan"
                sound: "qrc:/sounds/rain2.wav"
                image: "qrc:/icons/ic_wb_cloudy_24px.svg"
            },
            ListElement {
                name: qsTr("Stream")
                colorCode: "darkcyan"
                sound: "qrc:/sounds/stream.wav"
                image: "qrc:/icons/ic_pool_24px.svg"
            }
        ]
    }
    ListElement {
        categoryTitle: qsTr("Places")
        categoryColor: "firebrick"
        contents: [
            /*ListElement {
                name: qsTr("Bar")
                colorCode: "firebrick"
                sound: "qrc:/sounds/welcome.wav"
                image: "qrc:/icons/ic_local_bar_24px.svg"
            },
            ListElement {
                name: qsTr("Beach")
                colorCode: "firebrick"
                sound: "qrc:/sounds/selected.wav"
                image: "qrc:/icons/ic_beach_access_24px.svg"
            },
            ListElement {
                name: qsTr("Bedroom")
                colorCode: "firebrick"
                sound: "qrc:/sounds/enter.wav"
                image: "qrc:/icons/ic_local_hotel_24px.svg"
            },
            ListElement {
                name: qsTr("Busy street")
                colorCode: "firebrick"
                sound: "qrc:/sounds/computer.wav"
                image: "qrc:/icons/ic_traffic_24px.svg"
            },*/
            ListElement {
                name: qsTr("Playground")
                colorCode: "firebrick"
                sound: "qrc:/sounds/playground.wav"
                image: "qrc:/icons/ic_child_care_24px.svg"
            },
            ListElement {
                name: qsTr("Coffee shop")
                colorCode: "firebrick"
                sound: "qrc:/sounds/coffeeshop.wav"
                image: "qrc:/icons/ic_local_cafe_24px.svg"
            },
            ListElement {
                name: qsTr("Shopping")
                colorCode: "firebrick"
                sound: "qrc:/sounds/shopping.wav"
                image: "qrc:/icons/ic_shopping_cart_24px.svg"
            }/*,
            ListElement {
                name: qsTr("Office")
                colorCode: "firebrick"
                sound: "qrc:/sounds/computer.wav"
                image: "qrc:/icons/ic_work_24px.svg"
            },
            ListElement {
                name: qsTr("Party")
                colorCode: "firebrick"
                sound: "qrc:/sounds/enter.wav"
                image: "qrc:/icons/ic_cake_24px.svg"
            },
            ListElement {
                name: qsTr("Theater")
                colorCode: "firebrick"
                sound: "qrc:/sounds/selected.wav"
                image: "qrc:/icons/ic_theaters_24px.svg"
            }*/
        ]
    }
    ListElement {
        categoryTitle: qsTr("Transport")
        categoryColor: "darkslategrey"
        contents: [
            ListElement {
                name: qsTr("Airplane")
                colorCode: "darkslategrey"
                sound: "qrc:/sounds/aircraft.wav"
                image: "qrc:/icons/ic_airplanemode_active_24px.svg"
            },
            ListElement {
                name: qsTr("Bus")
                colorCode: "darkslategrey"
                sound: "qrc:/sounds/bus.wav"
                image: "qrc:/icons/ic_directions_bus_24px.svg"
            },
            ListElement {
                name: qsTr("Car")
                colorCode: "darkslategrey"
                sound: "qrc:/sounds/car.wav"
                image: "qrc:/icons/ic_directions_car_24px.svg"
            },
            ListElement {
                name: qsTr("Motorcycle")
                colorCode: "darkslategrey"
                sound: "qrc:/sounds/moto.wav"
                image: "qrc:/icons/ic_motorcycle_24px.svg"
            },
            ListElement {
                name: qsTr("Subway")
                colorCode: "darkslategrey"
                sound: "qrc:/sounds/metro.wav"
                image: "qrc:/icons/ic_directions_subway_24px.svg"
            },
            ListElement {
                name: qsTr("Trolley")
                colorCode: "darkslategrey"
                sound: "qrc:/sounds/trolley.wav"
                image: "qrc:/icons/ic_local_shipping_24px.svg"
            }
        ]
    }

}


