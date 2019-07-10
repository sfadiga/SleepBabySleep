import QtQuick 2.12

ListModel {
    id: soundListModel
    ListElement {
        categoryTitle: qsTr("Appliances")
        categoryColor: "lightpink"
        contents: [
            ListElement {
                name: qsTr("Clock")
                colorCode: "lightcoral"
                sound: "qrc:/sounds/computers.wav"
                image: "qrc:/icons/ic_alarm_24px.svg"
            },
            ListElement {
                name: qsTr("Computer")
                colorCode: "lightcoral"
                sound: "qrc:/sounds/computers.wav"
                image: "qrc:/icons/ic_speaker_24px.svg"
            },
            ListElement {
                name: qsTr("Fan")
                colorCode: "lightcoral"
                sound: "qrc:/sounds/computers.wav"
                image: "qrc:/icons/ic_toys_24px.svg"
            },
            ListElement {
                name: qsTr("Hair dryer")
                colorCode: "lightcoral"
                sound: "qrc:/sounds/computers.wav"
                image: "qrc:/icons/ic_toys_24px.svg"
            },
            ListElement {
                name: qsTr("Microwave")
                colorCode: "lightcoral"
                sound: "qrc:/sounds/computers.wav"
                image: "qrc:/icons/ic_scanner_24px.svg"
            },
            ListElement {
                name: qsTr("Quiet Tv")
                colorCode: "lightcoral"
                sound: "qrc:/sounds/computers.wav"
                image: "qrc:/icons/ic_tv_24px.svg"
            },
            ListElement {
                name: qsTr("Refrigerator")
                colorCode: "lightcoral"
                sound: "qrc:/sounds/computers.wav"
                image: "qrc:/icons/ic_kitchen_24px.svg"
            },
            ListElement {
                name: qsTr("Radio")
                colorCode: "lightcoral"
                sound: "qrc:/sounds/computers.wav"
                image: "qrc:/icons/ic_radio_24px.svg"
            },
            ListElement {
                name: qsTr("Vacuum cleaner")
                colorCode: "lightcoral"
                sound: "qrc:/sounds/computers.wav"
                image: "qrc:/icons/ic_tv_24px.svg"
            },
            ListElement {
                name: qsTr("Washing machine")
                colorCode: "lightcoral"
                sound: "qrc:/sounds/computers.wav"
                image: "qrc:/icons/ic_local_laundry_service_24px.svg"
            },
            ListElement {
                name: qsTr("White noise")
                colorCode: "lightcoral"
                sound: "qrc:/sounds/computers.wav"
                image: "qrc:/icons/ic_tv_24px.svg"
            }
        ]
    }
    ListElement {
        categoryTitle: qsTr("Nature")
        categoryColor: "darkcyan"
        contents: [
            ListElement {
                name: qsTr("Heart beat")
                colorCode: "darkcyan"
                sound: "qrc:/sounds/selected.wav"
                image: "qrc:/icons/ic_heart_24px.svg"
            },
            ListElement {
                name: qsTr("Fire")
                colorCode: "darkcyan"
                sound: "qrc:/sounds/selected.wav"
                image: "qrc:/icons/ic_fire_24px.svg"
            },
            ListElement {
                name: qsTr("Forest")
                colorCode: "darkcyan"
                sound: "qrc:/sounds/enter.wav"
                image: "qrc:/icons/ic_local_florist_24px.svg"
            },
            ListElement {
                name: qsTr("Rain")
                colorCode: "darkcyan"
                sound: "qrc:/sounds/selected.wav"
                image: "qrc:/icons/ic_wb_cloudy_24px.svg"
            },
            ListElement {
                name: qsTr("Stream")
                colorCode: "darkcyan"
                sound: "qrc:/sounds/selected.wav"
                image: "qrc:/icons/ic_pool_24px.svg"
            }
        ]
    }
    ListElement {
        categoryTitle: qsTr("Places")
        categoryColor: "burlywood"
        contents: [
            ListElement {
                name: qsTr("Bar")
                colorCode: "burlywood"
                sound: "qrc:/sounds/selected.wav"
                image: "qrc:/icons/ic_local_bar_24px.svg"
            },
            ListElement {
                name: qsTr("Beach")
                colorCode: "burlywood"
                sound: "qrc:/sounds/selected.wav"
                image: "qrc:/icons/ic_beach_access_24px.svg"
            },
            ListElement {
                name: qsTr("Bedroom")
                colorCode: "burlywood"
                sound: "qrc:/sounds/selected.wav"
                image: "qrc:/icons/ic_local_hotel_24px.svg"
            },
            ListElement {
                name: qsTr("Busy street")
                colorCode: "burlywood"
                sound: "qrc:/sounds/selected.wav"
                image: "qrc:/icons/ic_traffic_24px.svg"
            },
            ListElement {
                name: qsTr("Child room")
                colorCode: "burlywood"
                sound: "qrc:/sounds/selected.wav"
                image: "qrc:/icons/ic_child_care_24px.svg"
            },
            ListElement {
                name: qsTr("Cafe")
                colorCode: "burlywood"
                sound: "qrc:/sounds/selected.wav"
                image: "qrc:/icons/ic_local_cafe_24px.svg"
            },
            ListElement {
                name: qsTr("Market")
                colorCode: "burlywood"
                sound: "qrc:/sounds/selected.wav"
                image: "qrc:/icons/ic_shopping_cart_24px.svg"
            },
            ListElement {
                name: qsTr("Office")
                colorCode: "burlywood"
                sound: "qrc:/sounds/selected.wav"
                image: "qrc:/icons/ic_work_24px.svg"
            },
            ListElement {
                name: qsTr("Party")
                colorCode: "burlywood"
                sound: "qrc:/sounds/enter.wav"
                image: "qrc:/icons/ic_cake_24px.svg"
            },
            ListElement {
                name: qsTr("Theater")
                colorCode: "burlywood"
                sound: "qrc:/sounds/selected.wav"
                image: "qrc:/icons/ic_theaters_24px.svg"
            }
        ]
    }
    ListElement {
        categoryTitle: qsTr("Transport")
        categoryColor: "lightgray"
        contents: [
            ListElement {
                name: qsTr("Airplane")
                colorCode: "gray"
                sound: "qrc:/sounds/selected.wav"
                image: "qrc:/icons/ic_airplanemode_active_24px.svg"
            },
            ListElement {
                name: qsTr("Bus")
                colorCode: "gray"
                sound: "qrc:/sounds/enter.wav"
                image: "qrc:/icons/ic_directions_bus_24px.svg"
            },
            ListElement {
                name: qsTr("Car")
                colorCode: "gray"
                sound: "qrc:/sounds/selected.wav"
                image: "qrc:/icons/ic_directions_car_24px.svg"
            },
            ListElement {
                name: qsTr("Motorcycle")
                colorCode: "gray"
                sound: "qrc:/sounds/selected.wav"
                image: "qrc:/icons/ic_motorcycle_24px.svg"
            },
            ListElement {
                name: qsTr("Subway")
                colorCode: "gray"
                sound: "qrc:/sounds/selected.wav"
                image: "qrc:/icons/ic_directions_subway_24px.svg"
            },
            ListElement {
                name: qsTr("Truck")
                colorCode: "gray"
                sound: "qrc:/sounds/selected.wav"
                image: "qrc:/icons/ic_local_shipping_24px.svg"
            }
        ]
    }

}


