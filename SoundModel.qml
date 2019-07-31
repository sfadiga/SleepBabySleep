import QtQuick 2.13

ListModel {
    id: soundListModel
    ListElement {
        categoryTitle: qsTr("Baby")
        categoryColor: "#ffeaa7"//"burlywood"
        contents: [
            ListElement {
                name: qsTr("Shaker")
                colorCode: "burlywood"
                sound: "qrc:/sounds/shaker.wav"
                image: "qrc:/icons/ic_shaker_24px.svg"
                type: "wav"
            },
            ListElement {
                name: qsTr("Shhh 1")
                colorCode: "burlywood"
                sound: "qrc:/sounds/shhh.wav"
                image: "qrc:/icons/ic_child_friendly_24px.svg"
                type: "wav"
            },
            ListElement {
                name: qsTr("Shhh 2")
                colorCode: "burlywood"
                sound: "qrc:/sounds/shhh1.wav"
                image: "qrc:/icons/ic_child_friendly_24px.svg"
                type: "wav"
            },
            ListElement {
                name: qsTr("Hum 1")
                colorCode: "burlywood"
                sound: "qrc:/sounds/hum1.wav"
                image: "qrc:/icons/ic_child_friendly_24px.svg"
                type: "wav"
            },
            ListElement {
                name: qsTr("Hum 2")
                colorCode: "burlywood"
                sound: "qrc:/sounds/hum2.wav"
                image: "qrc:/icons/ic_child_friendly_24px.svg"
                type: "wav"
            },
            ListElement {
                name: qsTr("Hum 3")
                colorCode: "burlywood"
                sound: "qrc:/sounds/hum3.wav"
                image: "qrc:/icons/ic_child_friendly_24px.svg"
                type: "wav"
            },
            ListElement {
                name: qsTr("Music 1")
                colorCode: "burlywood"
                sound: "qrc:/sounds/music1.mp3"
                image: "qrc:/icons/ic_music_note_24px.svg"
                type: "mp3"
            },
            ListElement {
                name: qsTr("Music 2")
                colorCode: "burlywood"
                sound: "qrc:/sounds/music2.mp3"
                image: "qrc:/icons/ic_music_note_24px.svg"
                type: "mp3"
            },
            ListElement {
                name: qsTr("Music 3")
                colorCode: "burlywood"
                sound: "qrc:/sounds/music3.mp3"
                image: "qrc:/icons/ic_music_note_24px.svg"
                type: "mp3"
            },
            ListElement {
                name: qsTr("Music 4")
                colorCode: "burlywood"
                sound: "qrc:/sounds/music4.mp3"
                image: "qrc:/icons/ic_music_note_24px.svg"
                type: "mp3"
            },
            ListElement {
                name: qsTr("Music 5")
                colorCode: "burlywood"
                sound: "qrc:/sounds/music5.mp3"
                image: "qrc:/icons/ic_music_note_24px.svg"
                type: "mp3"
            },
            ListElement {
                name: qsTr("Music 6")
                colorCode: "burlywood"
                sound: "qrc:/sounds/music6.mp3"
                image: "qrc:/icons/ic_music_note_24px.svg"
                type: "mp3"
            },
            ListElement {
                name: qsTr("Music 7")
                colorCode: "burlywood"
                sound: "qrc:/sounds/music7.mp3"
                image: "qrc:/icons/ic_music_note_24px.svg"
                type: "mp3"
            }

        ]
    }
    ListElement {
        categoryTitle: qsTr("Nature")
        categoryColor: "#55efc4"
        contents: [
            ListElement {
                name: qsTr("Heart beat 1")
                colorCode: "#00b894"
                sound: "qrc:/sounds/heart.wav"
                image: "qrc:/icons/ic_heart_24px.svg"
                type: "wav"
            },
            ListElement {
                name: qsTr("Heart beat 2")
                colorCode: "#00b894"
                sound: "qrc:/sounds/heart2.wav"
                image: "qrc:/icons/ic_heart_24px.svg"
                type: "wav"
            },
            ListElement {
                name: qsTr("Fire 1")
                colorCode: "#00b894"
                sound: "qrc:/sounds/fire.wav"
                image: "qrc:/icons/ic_whatshot_24px.svg"
                type: "wav"
            },
            ListElement {
                name: qsTr("Fire 2")
                colorCode: "#00b894"
                sound: "qrc:/sounds/fire1.wav"
                image: "qrc:/icons/ic_whatshot_24px.svg"
                type: "wav"
            },
            ListElement {
                name: qsTr("Forest")
                colorCode: "#00b894"
                sound: "qrc:/sounds/forest.wav"
                image: "qrc:/icons/ic_local_florist_24px.svg"
                type: "wav"
            },
            ListElement {
                name: qsTr("Mom")
                colorCode: "#00b894"
                sound: "qrc:/sounds/uterus.wav"
                image: "qrc:/icons/ic_mom_24px.svg"
                type: "wav"
            },
            ListElement {
                name: qsTr("Rain 1")
                colorCode: "#00b894"
                sound: "qrc:/sounds/rain.wav"
                image: "qrc:/icons/ic_wb_cloudy_24px.svg"
                type: "wav"
            },
            ListElement {
                name: qsTr("Rain 2")
                colorCode: "#00b894"
                sound: "qrc:/sounds/rain2.wav"
                image: "qrc:/icons/ic_wb_cloudy_24px.svg"
                type: "wav"
            },
            ListElement {
                name: qsTr("Stream")
                colorCode: "#00b894"
                sound: "qrc:/sounds/stream.wav"
                image: "qrc:/icons/ic_pool_24px.svg"
                type: "wav"
            }
        ]
    }
    ListElement {
        categoryTitle: qsTr("House")
        categoryColor: "#0984e3"
        contents: [
            ListElement {
                name: qsTr("Computer")
                colorCode: "#0984e3"
                sound: "qrc:/sounds/computer.wav"
                image: "qrc:/icons/ic_computer_24px.svg"
                type: "wav"
            },
            ListElement {
                name: qsTr("Clock")
                colorCode: "#0984e3"
                sound: "qrc:/sounds/clock.wav"
                image: "qrc:/icons/ic_alarm_24px.svg"
                type: "wav"
            },
            ListElement {
                name: qsTr("Fan")
                colorCode: "#0984e3"
                sound: "qrc:/sounds/fan.wav"
                image: "qrc:/icons/ic_toys_24px.svg"
                type: "wav"
            },
            ListElement {
                name: qsTr("Hair dryer 1")
                colorCode: "#0984e3"
                sound: "qrc:/sounds/hairdryer.wav"
                image: "qrc:/icons/ic_hairdryer_24px.svg"
                type: "wav"
            },
            ListElement {
                name: qsTr("Hair dryer 2")
                colorCode: "#0984e3"
                sound: "qrc:/sounds/hairdryer2.wav"
                image: "qrc:/icons/ic_hairdryer_24px.svg"
                type: "wav"
            },
            ListElement {
                name: qsTr("Hair dryer 3")
                colorCode: "#0984e3"
                sound: "qrc:/sounds/hairdryer3.wav"
                image: "qrc:/icons/ic_hairdryer_24px.svg"
                type: "wav"
            },
            ListElement {
                name: qsTr("Microwave 1")
                colorCode: "#0984e3"
                sound: "qrc:/sounds/microwave.wav"
                image: "qrc:/icons/ic_microwave_24px.svg"
                type: "wav"
            },
            ListElement {
                name: qsTr("Microwave 2")
                colorCode: "#0984e3"
                sound: "qrc:/sounds/microwave2.wav"
                image: "qrc:/icons/ic_microwave_24px.svg"
                type: "wav"
            },

            ListElement {
                name: qsTr("Vacuum cleaner")
                colorCode: "#0984e3"
                sound: "qrc:/sounds/vacuumcleaner.wav"
                image: "qrc:/icons/ic_vacuumcleaner_24px.svg"
                type: "wav"
            },

            ListElement {
                name: qsTr("Shaver")
                colorCode: "#0984e3"
                sound: "qrc:/sounds/shaver.wav"
                image: "qrc:/icons/ic_shaver_24px.svg"
                type: "wav"
            },
            ListElement {
                name: qsTr("White noise 1")
                colorCode: "#0984e3"
                sound: "qrc:/sounds/whitenoise.wav"
                image: "qrc:/icons/ic_tv_24px.svg"
                type: "wav"
            },
            ListElement {
                name: qsTr("White noise 2")
                colorCode: "#0984e3"
                sound: "qrc:/sounds/whitenoise2.wav"
                image: "qrc:/icons/ic_tv_24px.svg"
                type: "wav"
            },
            ListElement {
                name: qsTr("Dishwasher")
                colorCode: "#0984e3"
                sound: "qrc:/sounds/dishwasher.wav"
                image: "qrc:/icons/ic_dishwasher_24px.svg"
                type: "wav"
            },
            ListElement {
                name: qsTr("Washing machine")
                colorCode: "#0984e3"
                sound: "qrc:/sounds/washingmachine.wav"
                image: "qrc:/icons/ic_local_laundry_service_24px.svg"
                type: "wav"
            },
            ListElement {
                name: qsTr("Faucet")
                colorCode: "#0984e3"
                sound: "qrc:/sounds/faucet.wav"
                image: "qrc:/icons/ic_faucet_24px.svg"
                type: "wav"
            },
            ListElement {
                name: qsTr("Toilet")
                colorCode: "#0984e3"
                sound: "qrc:/sounds/toilet.wav"
                image: "qrc:/icons/ic_wc_24px.svg"
                type: "wav"
            },
            ListElement {
                name: qsTr("Shower")
                colorCode: "#0984e3"
                sound: "qrc:/sounds/shower.wav"
                image: "qrc:/icons/ic_shower_24px.svg"
                type: "wav"
            }
        ]
    }
    ListElement {
        categoryTitle: qsTr("Transport")
        categoryColor: "#dfe6e9"
        contents: [
            ListElement {
                name: qsTr("Airplane")
                colorCode: "#b2bec3"
                sound: "qrc:/sounds/aircraft.wav"
                image: "qrc:/icons/ic_airplanemode_active_24px.svg"
                type: "wav"
            },
            ListElement {
                name: qsTr("Bus")
                colorCode: "#b2bec3"
                sound: "qrc:/sounds/bus.wav"
                image: "qrc:/icons/ic_directions_bus_24px.svg"
                type: "wav"
            },
            ListElement {
                name: qsTr("Car 1")
                colorCode: "#b2bec3"
                sound: "qrc:/sounds/car.wav"
                image: "qrc:/icons/ic_directions_car_24px.svg"
                type: "wav"
            },
            ListElement {
                name: qsTr("Car 2")
                colorCode: "#b2bec3"
                sound: "qrc:/sounds/car2.wav"
                image: "qrc:/icons/ic_directions_car_24px.svg"
                type: "wav"
            },
            ListElement {
                name: qsTr("Motorcycle")
                colorCode: "#b2bec3"
                sound: "qrc:/sounds/moto.wav"
                image: "qrc:/icons/ic_motorcycle_24px.svg"
                type: "wav"
            },
            ListElement {
                name: qsTr("Subway 1")
                colorCode: "#b2bec3"
                sound: "qrc:/sounds/metro.wav"
                image: "qrc:/icons/ic_directions_subway_24px.svg"
                type: "wav"
            },
            ListElement {
                name: qsTr("Subway 2")
                colorCode: "#b2bec3"
                sound: "qrc:/sounds/metro2.wav"
                image: "qrc:/icons/ic_directions_subway_24px.svg"
                type: "wav"
            },
            ListElement {
                name: qsTr("Subway 3")
                colorCode: "#b2bec3"
                sound: "qrc:/sounds/metro3.wav"
                image: "qrc:/icons/ic_directions_subway_24px.svg"
                type: "wav"
            },
            ListElement {
                name: qsTr("Trolley")
                colorCode: "#b2bec3"
                sound: "qrc:/sounds/trolley.wav"
                image: "qrc:/icons/ic_train_24px.svg"
                type: "wav"
            }
        ]
    }
    ListElement {
        categoryTitle: qsTr("Places")
        categoryColor: "#fab1a0"
        contents: [
            ListElement {
                name: qsTr("Bar")
                colorCode: "#e17055"
                sound: "qrc:/sounds/bar.wav"
                image: "qrc:/icons/ic_local_bar_24px.svg"
                type: "wav"
            },
            ListElement {
                name: qsTr("Party")
                colorCode: "#e17055"
                sound: "qrc:/sounds/party.mp3"
                image: "qrc:/icons/ic_cake_24px.svg"
                type: "mp3"
            },
            ListElement {
                name: qsTr("Bedroom")
                colorCode: "#e17055"
                sound: "qrc:/sounds/bedroom.mp3"
                image: "qrc:/icons/ic_local_hotel_24px.svg"
                type: "mp3"
            },
            ListElement {
                name: qsTr("Playground")
                colorCode: "#e17055"
                sound: "qrc:/sounds/playground.mp3"
                image: "qrc:/icons/ic_child_care_24px.svg"
                type: "mp3"
            },
            ListElement {
                name: qsTr("Coffee shop")
                colorCode: "#e17055"
                sound: "qrc:/sounds/coffeeshop.mp3"
                image: "qrc:/icons/ic_local_cafe_24px.svg"
                type: "mp3"
            },
            ListElement {
                name: qsTr("Shopping")
                colorCode: "#e17055"
                sound: "qrc:/sounds/shopping.wav"
                image: "qrc:/icons/ic_shopping_cart_24px.svg"
                type: "wav"
            }
        ]
    }
}


