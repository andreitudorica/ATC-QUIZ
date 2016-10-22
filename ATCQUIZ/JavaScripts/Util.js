function TextBox_onBlur(id, value, cssClass) {
    var tb = document.getElementById(id);
    if (tb.value == "") {
        tb.value = value;
        if (cssClass != null)
            tb.className = cssClass;
        else {
            tb.style.color = "Gray";
            tb.style.fontStyle = "italic";
        }
    }
}

function TextBox_onFocus(id, value, cssClass) {
    var tb = document.getElementById(id);
    if (tb.value == value) {
        tb.value = "";
        if (cssClass != null)
            tb.className = cssClass;
        else {
            tb.style.color = "Black";
            tb.style.fontStyle = "normal";
        }
    }
}

function PasswordTextBox_onBlur(id, value, cssClass) {
    var tb = document.getElementById(id);
    if (tb.value == "") {
        tb.value = value;
        tb.setAttribute("type", "text");
        if (cssClass != null)
            tb.className = cssClass;
        else {
            tb.style.color = "Gray";
            tb.style.fontStyle = "italic";
        }
    }
}

function PasswordTextBox_onFocus(id, value, cssClass) {
    var tb = document.getElementById(id);
    if (tb.value == value) {
        tb.value = "";
        tb.setAttribute("type", "password");
        if (cssClass != null)
            tb.className = cssClass;
        else {
            tb.style.color = "Black";
            tb.style.fontStyle = "normal";
        }
    }
}
function GetDateTimeNowToString() {
    var timeNow = new Date();

    var timeString = timeNow.getFullYear().toString() + "-";
    timeString += (timeNow.getMonth() + 1).toString() + "-";
    timeString += timeNow.getDate().toString() + " ";
    timeString += timeNow.getHours().toString() + ":";
    timeString += timeNow.getMinutes().toString() + ":";
    timeString += timeNow.getSeconds().toString();

    return timeString;
}

function MakeFileUpload(fileUploadId, serverButtonId, htmlButtonId) {
    //doesn't work in Internet Explorer
    var sb = document.getElementById(serverButtonId);
    //sb.className = "invisible";

    var fp = document.getElementById(fileUploadId);
    //fp.className = "invisible";

    var hb = document.getElementById(htmlButtonId);
    hb.setAttribute("onclick", "document.getElementById(\"" + fileUploadId + "\").click()");

    if (navigator.appName == "Microsoft Internet Explorer") {
        hb.style.display = "none";
    }
    else {
        fp.setAttribute("onchange", "document.getElementById(\"" + serverButtonId + "\").click()");
        fp.style.display = "none";
        sb.style.display = "none";
    }
}

function GetParameter(paramName) {
    var searchString = window.location.search.substring(1),
      i, val, params = searchString.split("&");

    for (i = 0; i < params.length; i++) {
        val = params[i].split("=");
        if (val[0] == paramName) {
            return val[1];
        }
    }
    return null;
}

function NewInput(obj) {
    var input = document.createElement("input");
    for (var property in obj) {
        if (property == "className")
            input.setAttribute("class", obj[property]);
        else
            input.setAttribute(property, obj[property]);
    }

    return input;
}

function NewSelect(obj) {
    var select = document.createElement("select");
    for (var property in obj) {
        if (property == "className")
            select.setAttribute("class", obj[property]);
        else if (property != "options")
            select.setAttribute(property, obj[property]);
    }
    if (obj["options"]) {
        for (var i = 0; i < obj["options"].length; i++)
            select.options[i] = new Option(obj["options"][i], obj["options"][i]);
    }
    return select;
}

function MessageBox(obj) {
    _msgBox = new MSGBox(obj);
    this.Show = function (message) {
        _msgBox.Show(message);
    }
    this.Close = function () {
        _msgBox.Close();
    }
}

function MSGBox(obj) {
    this.Config = function (obj) {
        if (obj == null)
            obj = new Object();

        this.divId = obj.divId != null ? obj.divId : "MBDiv";

    };
    if (obj == null)
        obj = new Object();
    this.Config(obj);
    this.Create = function () {
        var outerDiv = document.getElementById(this.divId);
        if (outerDiv == null) {
            outerDiv = document.createElement("div");
            outerDiv.id = this.divId;
            document.getElementsByTagName("body")[0].appendChild(outerDiv);
        }

        //create modal background
        var modalBackgroud = document.createElement("div");

        modalBackgroud.style.backgroundColor = "Black";
        modalBackgroud.style.height = "100%";
        modalBackgroud.style.left = 0;
        modalBackgroud.style.opacity = 0.6;
        modalBackgroud.style.position = "absolute";
        modalBackgroud.style.top = 0;
        modalBackgroud.style.width = "100%";
        modalBackgroud.style.zIndex = 500;

        outerDiv.appendChild(modalBackgroud);

        //create modal container
        var modalContainer = document.createElement("div");

        modalContainer.style.margin = "200px auto";
        modalContainer.style.position = "relative";
        modalContainer.style.width = "400px";
        modalContainer.style.height = "100px";
        modalContainer.style.zIndex = "750";

        modalBackgroud.appendChild(modalContainer);

        var top = document.createElement("div");
        top.id = "MBTop";
        top.style.color = "Black";
        top.style.backgroundColor = "White";
        top.padding = "20px";
        top.margin = "20px";
        top.style.height = "auto";
        top.style.padding = "10px";
        top.style.verticalAlign = "middle";
        top.style.textAlign = "center";
        modalContainer.appendChild(top);

        var bottom = document.createElement("div");
        bottom.id = "MBBottom";
        bottom.style.backgroundColor = "Black";
        bottom.width = "100%";
        bottom.style.margin = "10px";
        bottom.style.textAlign = "center";
        modalContainer.appendChild(bottom);

        var button = NewInput({ type: "button", value: "ok", onclick: "_msgBox.Close();" });
        bottom.appendChild(button);
    }
    this.Create();
    this.Show = function (message) {
        var outerDiv = document.getElementById(this.divId);

        window.onscroll = function () {
            document.getElementById(messageBox.divId).style.top = window.pageYOffset + 'px';
        };
        outerDiv.style.display = "block";
        outerDiv.style.top = window.pageYOffset + 'px';

        document.getElementById("MBTop").innerHTML = message;
    };
    this.Close = function () {
        document.getElementById(this.divId).innerHTML = "";
        window.onscroll = null;
    };
}

function Error_Callback(err) {
    alert(err);
};
function GetSelectValue(selectId) {
    var select = document.getElementById(selectId);
    return select.options[select.selectedIndex].value;
}
function GetSelectOptionsValues(selectId) {
    var array = new Array();
    var select = document.getElementById(selectId);

    for (var i = 0; i < select.length; i++)
        array.push(select.options[i].value);

    return array;
}
function RefreshPage() {
    window.location.reload()
}