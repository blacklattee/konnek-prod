class ChatWidget {
  /**
   *
   * @required @param {clientId} options
   * @required @param {clientSecret} options
   */

  constructor(options) {
    this.io = "";
    this.roomId = "";
    this.userId = "";
    this.sessionId = "";
    this.agentName = "";
    this.socket = "";
    this.socketToken = "";
    this.wrapperChat = "";
    this.metaData = {};
    this.callbackConversation = {};
    this.usermail = "";
    this.username = "";
    this.env = "production";
    this.error = "";
    this.isLoading = false;
    this.fileMediaUpload = "";
    this.patternMedia = [
      "jpeg",
      "png",
      "gif",
      "jpg",
      "JPG",
      "PNG",
      "JPEG",
      "GIF",
    ];
    this.reader = new FileReader();
    this.csatText = false;

    this.validate(options);

    this.clientId = options.clientId;
    this.clientSecret = options.clientSecret;
    this.optionemail = options.email ? options.email : "";
    this.optionname = options.name ? options.name : "";
    this.sso = options.sso ? options.sso : false;
    this.addInfo = options.additionalInfo ? options.additionalInfo : null;
    console.log("console")
    switch (options.env) {
      case "dev":
        this.baseURL = "http://192.168.1.74:8080";
        this.baseURLSocket = "http://192.168.1.74:3000";
        this.baseURLMedia = "http://192.168.1.72:9000/konnek/widget";
        break;
      case "prod":
        this.baseURL = "https://wekonnek.id:9443";
        this.baseURLSocket = "https://sck.wekonnek.id:3001";
        this.baseURLMedia = "https://media.wekonnek.id/konnek/widget";
        break;
      case "stg":
        this.baseURL = "https://stg.wekonnek.id:9443";
        this.baseURLSocket = "https://stgsck.wekonnek.id:3001";
        this.baseURLMedia = "https://media.wekonnek.id/konnek/widget";
        break;
    }

    this.botName = "";
    this.headerBackground = "#203080";
    this.headerTextColor = "#ffffff";
    this.headerButtonColor = "#ffffff";
    this.widgetIcon = "";
    this.widgetIconBackgroundColor = "#203080";
    this.startChatText = self.isLoading ? "Loading" : "Start Chat";
    this.startChatTextColor = "#dddddd";
    this.text_button = "Click";
    this.text_button_color = "#ffffff";
    this.button_color = "#2a55a4";
    this.iconChat = this.baseURLMedia + "/assets/images/chat_icon.png";
    this.botImage = this.baseURLMedia + "/assets/images/avataaars.png";
    this.greeting = "Let me help you :)";
  }

  validate(options) {
    if (options.clientId === undefined || options.clientId == "") {
      this.error = "ChatWidget - Client ID is required and cannot be empty";
    }

    if (options.clientSecret === undefined || options.clientSecret == "") {
      this.error = "ChatWidget - Client Secret is required and cannot be empty";
    }
  }

  getBase64(file, callback) {
    var self = this;

    self.reader.addEventListener("load", () => callback(self.reader.result));
    self.reader.readAsDataURL(file);
    return self.reader;
  }

  /**
   * --------------------------------------------------------------
   * INITIAL
   * --------------------------------------------------------------
   * Setup all property
   * --------------------------------------------------------------
   */
  init(io) {
    if (this.error != "") {
      console.error(this.error);
      return;
    }

    var self = this;
    self.io = io;
    this.getConfig(function (success, resp) {
      if (success) {
        self.botName = resp.data.avatar_name;
        self.botImage = resp.data.avatar_image;
        self.headerBackground = resp.data.header_background_color;
        self.headerTextColor = resp.data.header_text_color;
        self.widgetIcon = resp.data.widget_icon;
        self.greeting = resp.data.greeting_message;
        self.text_button = resp.data.text_button;
        self.text_button_color = resp.data.text_button_color;
        self.button_color = resp.data.button_color;

        self.load();
      }
    });
    return this;
  }

  /**
   * --------------------------------------------------------------
   * LOAD VIEW
   * --------------------------------------------------------------
   * Load all the component
   * --------------------------------------------------------------
   */
  load() {
    var self = this;
    // generate html using javascript
    var head = document.getElementsByTagName("head")[0];
    var link = document.createElement("link");
    link.rel = "stylesheet";
    link.type = "text/css";
    link.href =
      "https://fonts.googleapis.com/css2?family=Ubuntu:wght@400;500&display=swap";
    head.appendChild(link);

    var linkFontAwesome = document.createElement("link");
    linkFontAwesome.rel = "stylesheet";
    linkFontAwesome.type = "text/css";
    linkFontAwesome.href =
      "https://pro.fontawesome.com/releases/v5.10.0/css/all.css";
    head.appendChild(linkFontAwesome);

    var linkIcon = document.createElement("link");
    linkIcon.rel = "stylesheet";
    linkIcon.href = "https://kit.fontawesome.com/a076d05399.js";
    head.appendChild(linkIcon);

    var body = document.getElementsByTagName("BODY")[0];
    var widgetDiv = document.createElement("div");
    widgetDiv.setAttribute("id", "wdgt_wrapper");
    widgetDiv.style.position = "fixed";
    widgetDiv.style.right = "50px";
    widgetDiv.style.bottom = "20px";
    widgetDiv.style.display = "flex";
    widgetDiv.style.flexDirection = "column";
    widgetDiv.style.alignItems = "flex-end";
    widgetDiv.style.zIndex = "9999";

    /**
     * --------------------------------------------------------------
     * CHAT BUTTON
     * --------------------------------------------------------------
     */

    var wrapperButtonChat = document.createElement("div");
    wrapperButtonChat.style.margin = "15px";

    var buttonChat = document.createElement("button");
    buttonChat.setAttribute("id", "wdgt_chat_icon");
    buttonChat.setAttribute("class", "btn-widget-chat");
    buttonChat.style.backgroundColor = this.button_color;

    buttonChat.style.width = "100%";
    buttonChat.style.maxWidth = "250px";
    buttonChat.style.height = "auto";
    buttonChat.style.borderRadius = "8px";
    buttonChat.style.marginLeft = "auto";
    buttonChat.style.padding = "3px";
    buttonChat.style.cursor = "pointer";
    buttonChat.style.overflow = "hidden";
    buttonChat.style.textOverflow = "ellipsis";
    buttonChat.style.whiteSpace = "nowrap";
    buttonChat.style.display = "flex";
    buttonChat.style.alignItems = "center";
    buttonChat.style.justifyContent = "center";
    buttonChat.style.border = `1px solid ${this.button_color}`;
    // buttonChat.style.boxShadow = "rgb(0 0 0 / 11%) 0px 0px 10px 4px";
    wrapperButtonChat.appendChild(buttonChat);

    if (this.widgetIcon != "") {
      var iconChat = document.createElement("img");
      iconChat.src = this.widgetIcon;
      iconChat.style.width = "100%";
      iconChat.style.maxWidth = "50%";
      iconChat.style.height = "auto";
      iconChat.style.objectFit = "cover";
      iconChat.style.marginRight = "10px";
      buttonChat.appendChild(iconChat);

      var textButton = document.createElement("span");
      textButton.style.color = this.text_button_color;
      textButton.style.fontSize = "16px";
      textButton.style.fontWeight = "bold";
      textButton.style.fontFamily = "'Ubuntu'";
      textButton.style.maxWidth = "100%";
      textButton.style.textShadow = "2px 2px 4px rgba(0, 0, 0, 0.5)";
      textButton.textContent = this.text_button;
      buttonChat.appendChild(textButton);
    } else {
      buttonChat.style.padding = "20px";

      var textButton = document.createElement("span");
      textButton.style.color = this.text_button_color;
      textButton.style.fontSize = "16px";
      textButton.style.fontWeight = "bold";
      textButton.style.fontFamily = "'Ubuntu'";
      textButton.style.maxWidth = "100%";
      textButton.style.textShadow = "2px 2px 4px rgba(0, 0, 0, 0.5)";
      textButton.textContent = this.text_button;
      buttonChat.appendChild(textButton);
    }

    /**
     * --------------------------------------------------------------
     * MEDIA QUERY WRAPPER WIDGET
     * --------------------------------------------------------------
     */

    /**
     * --------------------------------------------------------------
     * CHAT BOX
     * --------------------------------------------------------------
     */
    var chatBox = document.createElement("div");
    chatBox.setAttribute("id", "wdgt_chatbox");
    chatBox.style.minHeight = "200px";
    chatBox.style.width = "390px";
    chatBox.style.display = "none";
    chatBox.style.margin = "10px 10px";
    chatBox.style.backgroundColor = "#ffffff";
    chatBox.style.border = "none";
    chatBox.style.borderTopLeftRadius = "12px";
    chatBox.style.borderTopRightRadius = "12px";
    chatBox.style.borderBottomRightRadius = "12px";
    chatBox.style.borderBottomLeftRadius = "12px";
    // chatBox.style.borderColor = this.headerBackground
    chatBox.style.boxShadow =
      "0 2.8px 2.2px rgba(0, 0, 0, 0.034), 0 6.7px 5.3px rgba(0, 0, 0, 0.048), 0 12.5px 10px rgba(0, 0, 0, 0.06), 0 22.3px 17.9px rgba(0, 0, 0, 0.072), 0 41.8px 33.4px rgba(0, 0, 0, 0.086), 0 100px 80px rgba(0, 0, 0, 0.12)";
    document.getElementById("myBtn");

    /**
     * --------------------------------------------------------------
     * HEADER - CHAT BOX
     * --------------------------------------------------------------
     */
    var headerChatBox = document.createElement("div");
    headerChatBox.style.backgroundColor = this.headerBackground;
    headerChatBox.style.color = this.headerTextColor;
    headerChatBox.style.display = "flex";
    headerChatBox.style.alignItems = "center";
    // headerChatBox.style.justifyContent = 'space-between'
    headerChatBox.style.padding = "12px 20px";
    // headerChatBox.innerHTML = "<span style='margin-left:60px; display:block;'>"+ this.botName+"</span><span style='font-size: 8pt; margin-left:60px; display:block;'>Online</span>"
    // headerChatBox.innerHTML = "<span style='font-size: 24px; font-weight: bold; line-height: 0.75; color: rgb(255, 255, 255);'>"+ this.botName+"</span>"
    headerChatBox.style.borderTopLeftRadius = "12px";
    headerChatBox.style.borderTopRightRadius = "12px";
    headerChatBox.style.fontFamily = "'Ubuntu'";

    /**
     * --------------------------------------------------------------
     * HEADER - CHAT BOX AVATAR
     * --------------------------------------------------------------
     */

    var wrapperContentHeader = document.createElement("div");
    wrapperContentHeader.style.display = "flex";
    wrapperContentHeader.style.alignItems = "center";
    wrapperContentHeader.style.justifyContent = "flex-start";
    wrapperContentHeader.style.width = "90%";

    var avatar = document.createElement("img");
    avatar.style.width = "40px"
    avatar.style.height = "40px"
    avatar.style.marginRight = "1rem"
    avatar.style.borderRadius = "20px"
    avatar.src = this.botImage;
    wrapperContentHeader.appendChild(avatar);

    /**
     * --------------------------------------------------------------
     * HEADER - CHAT AVATAR NAME
     * --------------------------------------------------------------
     */

    var avatarName = document.createElement("span");
    avatarName.style.fontSize = "24px";
    avatarName.style.fontWeight = "bold";
    avatarName.style.color = this.headerTextColor;
    avatarName.textContent = this.botName;
    avatarName.style.boxSizing = "border-box";
    avatarName.style.fontFamily = "'Ubuntu'";
    wrapperContentHeader.appendChild(avatarName);
    headerChatBox.appendChild(wrapperContentHeader);

    /**
     * --------------------------------------------------------------
     * HEADER - MINIMIZER
     * --------------------------------------------------------------
     */
    var iconArrowHeader = document.createElement("i");
    iconArrowHeader.setAttribute("class", "fas fa-chevron-up");
    iconArrowHeader.style.color = this.headerTextColor;
    iconArrowHeader.style.width = "100%";

    var headerMinimizeIcon = document.createElement("span");
    headerMinimizeIcon.setAttribute("id", "wdgt_minimize");
    headerMinimizeIcon.style.transform = "rotateZ(180deg)";
    headerMinimizeIcon.style.width = "10%";
    headerMinimizeIcon.style.cursor = "pointer";

    headerMinimizeIcon.appendChild(iconArrowHeader);
    headerChatBox.appendChild(headerMinimizeIcon);
    chatBox.appendChild(headerChatBox);

    /**
     * --------------------------------------------------------------
     * CHAT BOX - BODY/CONTENT
     * --------------------------------------------------------------
     */
    var contentBox = document.createElement("div");
    contentBox.setAttribute("id", "wdgt_content_box");
    contentBox.style.height = "100%";
    contentBox.style.boxSizing = "border-box";
    contentBox.style.display = "block";
    contentBox.style.flex = "1 1 auto";
    contentBox.style.minHeight = "1px";

    /**
     * --------------------------------------------------------------
     * CHAT BOX - FORM
     * --------------------------------------------------------------
     * This will showed on the first time (we'll using cockies data)
     * --------------------------------------------------------------
     */

    var form = document.createElement("form");
    form.setAttribute("id", "wdgt_init_form");
    form.style.fontFamily = "'Ubuntu'";
    form.style.width = "auto";
    form.style.padding = "1.25rem 1.25rem 0.25rem 1.25rem";

    /**
     * --------------------------------------------------------------
     * CHAT BOX - FORM NAME LABEL
     * --------------------------------------------------------------
     */
    var labelName = document.createElement("label");
    labelName.style.fontSize = "9pt";
    labelName.style.marginBottom = "10px";
    labelName.style.display = "block";
    labelName.innerHTML = "Name :<br/>";
    form.appendChild(labelName);

    /**
     * --------------------------------------------------------------
     * CHAT BOX - FORM NAME INPUT
     * --------------------------------------------------------------
     */
    var inputName = document.createElement("input");
    inputName.setAttribute("name", "wdgt_input_username");
    inputName.setAttribute("type", "text");
    inputName.placeholder = "your name";
    inputName.style.padding = "10px";
    inputName.style.width = "100%";
    inputName.style.borderRadius = "8px";
    inputName.style.border = "5px solid #f1f1f1";
    inputName.style.backgroundColor = "#ffffff";
    if (self.optionname !== "" && self.sso === true)
      inputName.value = self.optionname;
    form.appendChild(inputName);

    /**
     * --------------------------------------------------------------
     * CHAT BOX - FORM NAME ERROR
     * --------------------------------------------------------------
     */
    var errorName = document.createElement("span");
    errorName.setAttribute("class", "wdgt_name_error");
    errorName.style.fontSize = "9pt";
    errorName.style.display = "block";
    errorName.style.textAlign = "right";
    errorName.style.marginTop = "5px";
    errorName.style.marginRight = "10px";
    errorName.style.color = "red";
    form.appendChild(errorName);

    /**
     * --------------------------------------------------------------
     * CHAT BOX - FORM EMAIL LABEL
     * --------------------------------------------------------------
     */
    var labelEmail = document.createElement("label");
    labelEmail.style.fontSize = "9pt";
    labelEmail.style.marginBottom = "10px";
    labelEmail.style.display = "block";
    labelEmail.innerHTML = "<br/><br/>Email :<br/>";
    form.appendChild(labelEmail);

    /**
     * --------------------------------------------------------------
     * CHAT BOX - FORM EMAIL INPUT
     * --------------------------------------------------------------
     */
    var inputEmail = document.createElement("input");
    inputEmail.setAttribute("name", "wdgt_input_email");
    inputEmail.setAttribute("type", "email");
    inputEmail.placeholder = "your emails";
    inputEmail.style.padding = "10px";
    inputEmail.style.width = "100%";
    inputEmail.style.borderRadius = "8px";
    inputEmail.style.border = "5px solid #f1f1f1";
    inputEmail.style.backgroundColor = "#ffffff";
    if (self.optionemail !== "" && self.sso === true)
      inputEmail.value = self.optionemail;
    form.appendChild(inputEmail);

    /**
     * --------------------------------------------------------------
     * CHAT BOX - FORM EMAIL ERROR
     * --------------------------------------------------------------
     */
    //console.log("HALO")
    var errorMail = document.createElement("span");
    errorMail.setAttribute("class", "wdgt_email_error");
    errorMail.style.fontSize = "9pt";
    errorMail.style.display = "block";
    errorMail.style.textAlign = "right";
    errorMail.style.marginTop = "5px";
    errorMail.style.marginRight = "10px";
    errorMail.style.color = "red";
    form.appendChild(errorMail);

    if (self.addInfo) {
      self.addInfo.forEach((entry) => {
        /**
         * --------------------------------------------------------------
         * CHAT BOX - FORM ADD INFO LABEL
         * --------------------------------------------------------------
         */
        if (entry.type !== null) {
          var labelAddInfo = document.createElement("label");
          labelAddInfo.style.fontSize = "9pt";
          labelAddInfo.style.marginBottom = "10px";
          labelAddInfo.style.display = "block";
          labelAddInfo.innerHTML = "<br/><br/>" + entry.label + " :<br/>";
          form.appendChild(labelAddInfo);

          if (entry.type == "input") {
            /**
             * --------------------------------------------------------------
             * CHAT BOX - FORM ADD INFO INPUT
             * --------------------------------------------------------------
             */
            var inputAddInfo = document.createElement("input");
            inputAddInfo.setAttribute("name", entry.name);
            inputAddInfo.setAttribute("type", "text");
            inputAddInfo.placeholder = entry.placeholder;
            inputAddInfo.style.padding = "10px";
            inputAddInfo.style.width = "100%";
            inputAddInfo.style.borderRadius = "8px";
            inputAddInfo.style.border = "5px solid #f1f1f1";
            inputAddInfo.style.backgroundColor = "#ffffff";
            inputAddInfo.textContent = entry.value ? entry.value : "";
            form.appendChild(inputAddInfo);
          } else if (entry.type == "autofill") {
            /**
             * --------------------------------------------------------------
             * CHAT BOX - FORM ADD INFO INPUT
             * --------------------------------------------------------------
             */
            var inputAddInfo = document.createElement("input");
            inputAddInfo.setAttribute("name", entry.name);
            inputAddInfo.setAttribute("type", "text");
            inputAddInfo.setAttribute("readonly", "readonly");
            inputAddInfo.placeholder = entry.placeholder;
            inputAddInfo.value = entry.value;
            inputAddInfo.style.padding = "10px";
            inputAddInfo.style.width = "100%";
            inputAddInfo.style.borderRadius = "8px";
            inputAddInfo.style.border = "5px solid #f1f1f1";
            inputAddInfo.style.backgroundColor = "#ffffff";
            form.appendChild(inputAddInfo);
          }
        }
      });
    }

    /**
     * --------------------------------------------------------------
     * CHAT BOX - FORM BUTTON SUBMIT
     * --------------------------------------------------------------
     */
    var submitInitChat = document.createElement("button");
    submitInitChat.setAttribute("id", "wdgt_submit_form");
    submitInitChat.style.width = "100%";
    submitInitChat.textContent = self.isLoading ? "Loading ..." : "Start Chat";
    submitInitChat.style.disabled = self.isLoading;
    submitInitChat.style.backgroundColor = this.headerBackground;
    submitInitChat.style.border = "none";
    submitInitChat.style.color = this.headerTextColor;
    submitInitChat.style.cursor = "pointer";
    submitInitChat.style.marginTop = "20px";
    submitInitChat.style.padding = "10px 10px";
    submitInitChat.style.textAlign = "center";
    submitInitChat.style.fontFamily = "'Ubuntu'";
    submitInitChat.style.fontSize = "11pt";
    submitInitChat.style.borderRadius = "7px";
    submitInitChat.style.display = "block";
    submitInitChat.style.marginLeft = "auto";
    submitInitChat.style.boxShadow = "0 4px 10px 0 rgb(42 85 164 / 41%)";

    form.appendChild(submitInitChat);

    contentBox.appendChild(form);
    chatBox.appendChild(contentBox);
    widgetDiv.appendChild(chatBox);
    widgetDiv.appendChild(wrapperButtonChat);
    body.appendChild(widgetDiv);

    /**
     * --------------------------------------------------------------
     * Generate bubble chat and wrapper it self
     * --------------------------------------------------------------
     */
    var wrpChat = document.createElement("ul");
    wrpChat.setAttribute("id", "wdgt_wrapper_chat");
    wrpChat.setAttribute("class", "wdgt_wrapper_chat_scroll");
    wrpChat.style.display = "none";

    wrpChat.style.padding = "1.25rem";
    wrpChat.style.overflowY = "scroll";
    wrpChat.style.height = "100%";
    wrpChat.style.maxHeight = "300px";
    wrpChat.style.listStyle = "none";
    wrpChat.style.margin = 0;
    wrpChat.style.backgroundColor = "#ffffff";
    wrpChat.style.fontFamily = "Ubuntu";
    wrpChat.style.overflowX = "scroll";
    // pagination when scroll

    var bubbleChatDaySeparator = document.createElement("li");
    bubbleChatDaySeparator.setAttribute("class", "title-day");
    bubbleChatDaySeparator.style.fontSize = "13px";
    bubbleChatDaySeparator.style.fontWeight = "bold";
    bubbleChatDaySeparator.style.marginBottom = "1rem";
    bubbleChatDaySeparator.style.color = "#b9bcc6";
    bubbleChatDaySeparator.style.textAlign = "center";
    bubbleChatDaySeparator.innerHTML = "TODAY";
    wrpChat.appendChild(bubbleChatDaySeparator);
    contentBox.appendChild(wrpChat);

    var viewPhone = window.matchMedia("(max-width: 600px)");
    function render(e) {
      if (e.matches) {
        // buttonChat.style.maxWidth = "65%"
        // buttonChat.style.padding = "6px"

        widgetDiv.style.width = "100%";
        widgetDiv.style.zIndex = "999999";
        widgetDiv.style.right = "0";
        widgetDiv.style.bottom = "0";

        chatBox.style.margin = "auto";
        chatBox.style.width = "100%";
        chatBox.style.minHeight = "100vh";
        chatBox.style.borderTopLeftRadius = "0";
        chatBox.style.borderTopRightRadius = "0";
        chatBox.style.borderBottomRightRadius = "0";
        chatBox.style.borderBottomLeftRadius = "0";

        headerChatBox.style.borderTopRightRadius = "0";
        headerChatBox.style.borderTopLeftRadius = "0";

        wrpChat.style.minHeight = "65vh";
      } else {
        chatBox.style.width = "390px";
        chatBox.style.minHeight = "200px";
        chatBox.style.marginBottom = "50px";
        wrpChat.style.minHeight = "300px";
        chatBox.style.borderBottomRightRadius = "12px";
        chatBox.style.borderBottomLeftRadius = "12px";
        headerChatBox.style.borderTopLeftRadius = "12px";
        headerChatBox.style.borderTopRightRadius = "12px";
        chatBox.style.margin = "10px";
      }
    }
    render(viewPhone);
    viewPhone.addEventListener("change", render);

    /**
     * --------------------------------------------------------------
     * GENERATE FORM INPUT MESSAGE
     * --------------------------------------------------------------
     */

    var wrapperChatInputForm = document.createElement("div");
    wrapperChatInputForm.setAttribute("id", "wrapper-input-message");
    wrapperChatInputForm.setAttribute(
      "class",
      "wdgt-bg-white wdgt-p-2 wdgt-card-footer"
    );
    wrapperChatInputForm.style.display = "none";
    wrapperChatInputForm.style.borderTop = "1px solid rgba(0, 0, 0, 0.125)";
    wrapperChatInputForm.style.padding = "0.5rem";
    wrapperChatInputForm.style.width = "100%";
    wrapperChatInputForm.style.boxSizing = "border-box";
    wrapperChatInputForm.style.borderRadius =
      "0 0 calc(0.25rem - 1px) calc(0.25rem - 1px)";

    var wrapperChatInputFormContainer = document.createElement("div");
    wrapperChatInputFormContainer.style.paddingRight = "0px";
    wrapperChatInputFormContainer.style.paddingLeft = "0px";
    wrapperChatInputFormContainer.style.marginLeft = "auto";
    wrapperChatInputFormContainer.style.marginRight = "auto";

    var wrapperContentMediaBase64 = document.createElement("div");
    wrapperContentMediaBase64.style.marginBottom = "10px";
    wrapperContentMediaBase64.style.display = "none";

    var contentImageBase64 = document.createElement("img");
    contentImageBase64.src = "";
    contentImageBase64.style.width = "30%";
    contentImageBase64.style.objectFit = "cover";
    contentImageBase64.style.borderRadius = "10px";
    contentImageBase64.style.marginBottom = "10px";
    contentImageBase64.style.marginRight = "10px";
    contentImageBase64.style.border = "5px solid #c5c5c5";
    contentImageBase64.style.order = "1";
    wrapperContentMediaBase64.appendChild(contentImageBase64);

    var contentDescriptionImageBase64 = document.createElement("span");
    contentDescriptionImageBase64.textContent = "";
    contentDescriptionImageBase64.style.fontSize = "12px";
    contentDescriptionImageBase64.style.fontFamily = "'Ubuntu'";
    contentDescriptionImageBase64.style.order = "2";
    contentDescriptionImageBase64.style.width = "58%";
    wrapperContentMediaBase64.appendChild(contentDescriptionImageBase64);

    var closeButton = document.createElement("img");
    closeButton.src = this.baseURLMedia + "/assets/images/ic-close.png";
    closeButton.style.width = "5%";
    closeButton.style.height = "5%";
    closeButton.style.cursor = "pointer";
    closeButton.style.order = "3";
    closeButton.style.marginLeft = "10px";
    closeButton.addEventListener("click", function (e) {
      wrapperContentMediaBase64.style.display = "none";
      self.fileMediaUpload = false;
    });
    wrapperContentMediaBase64.appendChild(closeButton);

    wrapperChatInputForm.appendChild(wrapperContentMediaBase64);
    // console.log('wrapperChatInputForm',wrapperChatInputForm)

    var wrapperChatInputFormContainerRow = document.createElement("div");
    wrapperChatInputFormContainerRow.style.display = "flex";
    wrapperChatInputFormContainerRow.style.alignItems = "center";
    wrapperChatInputFormContainerRow.style.justifyContent = "space-between";

    var wrapperChatInputFormContainerLeftSide = document.createElement("div");
    wrapperChatInputFormContainerLeftSide.style.padding = "0px";
    wrapperChatInputFormContainerLeftSide.style.position = "relative";
    wrapperChatInputFormContainerLeftSide.style.flex = "auto";
    wrapperChatInputFormContainerLeftSide.setAttribute(
      "class",
      "wdgt-col-md-9"
    );

    var wrapperChatInputFormChat = document.createElement("div");
    wrapperChatInputFormChat.setAttribute("class", "form-chat");

    var inputChatForm = document.createElement("TEXTAREA");
    inputChatForm.setAttribute("id", "input-chat-message");
    inputChatForm.placeholder = "Send a message...";
    inputChatForm.style.fontFamily = "'Ubuntu'";
    inputChatForm.style.resize = "none";
    //inputChatForm.style.width = "100%"
    inputChatForm.style.padding = "9px 50px 9px 11px";
    inputChatForm.style.borderRadius = "8px";
    inputChatForm.style.backgroundColor = "rgb(249, 250, 251)";
    inputChatForm.style.border = "1px solid rgb(249, 250, 251)";
    inputChatForm.style.fontFamily = "Ubuntu";

    wrapperChatInputFormChat.appendChild(inputChatForm);

    var wrapperChatInputFormChatButton = document.createElement("div");
    wrapperChatInputFormChatButton.setAttribute("class", "form-btn");
    wrapperChatInputFormChatButton.style.position = "absolute";
    wrapperChatInputFormChatButton.style.textAlign = "right";
    wrapperChatInputFormChatButton.style.right = "5%";
    wrapperChatInputFormChatButton.style.top = "20%";

    var chatInputFormChat = document.createElement("button");
    chatInputFormChat.setAttribute("id", "send_btn_chat");
    chatInputFormChat.style.transform = "rotate(45deg)";
    chatInputFormChat.style.cursor = "pointer";
    chatInputFormChat.style.borderRadius = "50%";
    chatInputFormChat.style.boxShadow = "0 5px 13px 0 rgb(42 85 164 / 41%)";
    chatInputFormChat.style.backgroundColor = this.headerBackground;
    //chatInputFormChat.style.backgroundImage = `url(https://media.wekonnek.id/konnek/widget/assets/images/ic-send.svg)`
    chatInputFormChat.style.backgroundPosition = "center center";
    chatInputFormChat.style.backgroundRepeat = "no-repeat";
    chatInputFormChat.style.padding = "10px";
    chatInputFormChat.style.border = "none";
    // chatInputFormChat.style.height = "15px"
    // chatInputFormChat.style.width = "45px"

    var chatSenddMessage = document.createElement("i");
    chatSenddMessage.setAttribute("class", "fa fa-location-arrow");
    chatSenddMessage.style.lineHeight = "16px";
    chatSenddMessage.style.color = this.headerTextColor;

    chatInputFormChat.appendChild(chatSenddMessage);

    wrapperChatInputFormChatButton.appendChild(chatInputFormChat);

    wrapperChatInputFormContainerLeftSide.appendChild(
      wrapperChatInputFormChatButton
    );

    wrapperChatInputFormContainerLeftSide.appendChild(wrapperChatInputFormChat);

    // right side
    var wrapperChatInputFormContainerRightSide = document.createElement("div");
    wrapperChatInputFormContainerRightSide.setAttribute(
      "class",
      "wdgt-col-md-3"
    );
    wrapperChatInputFormContainerRightSide.style.padding = "0px";
    // wrapperChatInputFormContainerRightSide.style.position = "relative"
    // wrapperChatInputFormContainerRightSide.style.flex = "0 0 25%"
    // wrapperChatInputFormContainerRightSide.style.maxWidth = "25%"

    var wrapperOptionButtonRow = document.createElement("div");
    wrapperOptionButtonRow.setAttribute("class", "wdgt-h-100");
    wrapperOptionButtonRow.style.display = "flex";
    wrapperOptionButtonRow.style.flexWrap = "wrap";
    wrapperOptionButtonRow.style.alignItems = "center";

    // wrapper upload image  button
    var wrapperButtonUpload = document.createElement("label");
    wrapperButtonUpload.style.boxSizing = "border-box";
    wrapperButtonUpload.style.marginBottom = "0";
    wrapperButtonUpload.style.marginTop = "auto";
    wrapperButtonUpload.style.width = "31.5px";
    wrapperButtonUpload.style.height = "31.5px";
    wrapperButtonUpload.style.marginTop = "3px";
    wrapperButtonUpload.style.marginLeft = "10px";
    wrapperButtonUpload.style.maxWidth = "100%";
    wrapperButtonUpload.style.cursor = "pointer";

    // wrapper attach button
    var wrapperButtonAttachmentUpload = document.createElement("label");

    wrapperButtonAttachmentUpload.style.boxSizing = "border-box";
    wrapperButtonAttachmentUpload.style.marginBottom = "auto";
    wrapperButtonAttachmentUpload.style.marginTop = "auto";
    wrapperButtonAttachmentUpload.style.width = "31.5px";
    wrapperButtonAttachmentUpload.style.height = "31.5px";
    wrapperButtonAttachmentUpload.style.marginTop = "3px";
    wrapperButtonAttachmentUpload.style.marginLeft = "10px";
    wrapperButtonAttachmentUpload.style.maxWidth = "100%";
    wrapperButtonAttachmentUpload.style.cursor = "pointer";

    var uploadAttachment = document.createElement("img");
    uploadAttachment.src =
      "https://media.wekonnek.id/konnek/widget/assets/images/ic-attach.png";
    uploadAttachment.style.width = "100%";
    wrapperButtonAttachmentUpload.appendChild(uploadAttachment);

    var inputUploadFile = document.createElement("input");
    inputUploadFile.setAttribute("id", "upload-file");
    inputUploadFile.setAttribute("name", "upload-file");
    inputUploadFile.setAttribute("type", "file");
    inputUploadFile.setAttribute("disabled", "");
    inputUploadFile.style.display = "none";
    inputUploadFile.addEventListener("click", function (event) {
      event.target.value = null;
    });
    inputUploadFile.addEventListener("change", function (e) {
      const { target } = e;
      const maxByte = 31457280;
      var file = target.files[0];
      if (file) {
        self.fileMediaUpload = file;
        self.getBase64(file, (res) => {
          const sizes = ["Bytes", "KB", "MB", "GB", "TB"];
          if (file.size == 0) return "0 Byte";
          const i = parseInt(Math.floor(Math.log(file.size) / Math.log(1024)));
          const sizeFile =
            Math.round(file.size / Math.pow(1024, i), 2) + " " + sizes[i];

          if (file.size > maxByte) {
            file = null;
            alert("File is too large, max 30mb");
          } else {
            var inputFileTypeImage = file["type"].split("/")[0] == "image" ? true : false;
            wrapperContentMediaBase64.style.display = "flex";
            wrapperContentMediaBase64.style.alignItems = "flex-start";
            wrapperContentMediaBase64.style.flexWrap = "wrap";
            wrapperContentMediaBase64.style.wordBreak = "break-word";
            contentImageBase64.src = inputFileTypeImage
              ? res
              : self.baseURLMedia + "/assets/images/ic-file.svg";
            var wrpInputFormMessage = document.getElementById(
              "wrapper-input-message"
            );
            wrpInputFormMessage.src = inputFileTypeImage
              ? res
              : self.baseURLMedia + "/assets/images/ic-file.svg";
            contentImageBase64.style.border = "none";
            contentDescriptionImageBase64.textContent = `File Name: ${file.name}, File Size: ${sizeFile}`;
             file = null;
          }
        });
      }
    });
    wrapperButtonAttachmentUpload.appendChild(inputUploadFile);

    wrapperOptionButtonRow.appendChild(wrapperButtonAttachmentUpload);

    wrapperChatInputFormContainerRightSide.appendChild(wrapperOptionButtonRow);

    wrapperChatInputFormContainerRow.appendChild(
      wrapperChatInputFormContainerLeftSide
    );

    wrapperChatInputFormContainerRow.appendChild(
      wrapperChatInputFormContainerRightSide
    );

    wrapperChatInputFormContainer.appendChild(wrapperChatInputFormContainerRow);

    wrapperChatInputForm.appendChild(wrapperChatInputFormContainer);

    // append powered by
    var wrapperPoweredBy = document.createElement("div");
    //  wrapperPoweredBy.style.display = "none"
    wrapperPoweredBy.setAttribute(
      "class",
      "wdgt-bg-white wdgt-p-2 wdgt-card-footer"
    );
    wrapperPoweredBy.style.borderTop = "1px solid rgba(0, 0, 0, 0.125)";
    wrapperPoweredBy.style.padding = "0.5rem";
    wrapperPoweredBy.style.textAlign = "center";
    wrapperPoweredBy.style.boxSizing = "border-box";
    wrapperPoweredBy.style.borderRadius =
      "0 0 calc(0.25rem - 1px) calc(0.25rem - 1px)";
    wrapperPoweredBy.style.fontFamily = "'Ubuntu'";
    wrapperPoweredBy.style.fontSize = "10px";
    wrapperPoweredBy.style.marginTop = "0";
    wrapperPoweredBy.innerHTML = `<div style='display: flex; justify-content: center; align-items: flex-end;'><font style='color:#000000'>Chat by</font> <img src='${this.baseURLMedia}/assets/images/sprint-logo.png' alt='logo' style='width: 50px; margin-left: 4px;'></div>`;

    var submitInitChat = document.createElement("button");
    submitInitChat.setAttribute("id", "wdgt_form_start");
    submitInitChat.style.width = "100%";
    submitInitChat.textContent = self.isLoading ? "Loading ..." : "Start Chat";
    submitInitChat.style.disabled = self.isLoading;
    submitInitChat.style.backgroundColor = this.headerBackground;
    submitInitChat.style.border = "none";
    submitInitChat.style.color = this.headerTextColor;
    submitInitChat.style.cursor = "pointer";
    submitInitChat.style.marginTop = "20px";
    submitInitChat.style.padding = "10px 10px";
    submitInitChat.style.textAlign = "center";
    submitInitChat.style.fontFamily = "'Ubuntu'";
    submitInitChat.style.fontSize = "11pt";
    submitInitChat.style.borderRadius = "7px";
    submitInitChat.style.display = "none";
    submitInitChat.style.marginLeft = "auto";
    submitInitChat.style.marginBottom = "20px";
    submitInitChat.style.boxShadow = "0 4px 10px 0 rgb(42 85 164 / 41%)";

    wrapperPoweredBy.prepend(submitInitChat);

    contentBox.appendChild(wrapperChatInputForm);

    contentBox.appendChild(wrapperPoweredBy);

    $(document).ready(function () {
      var username = document.getElementsByName("wdgt_input_username")[0];
      var email = document.getElementsByName("wdgt_input_email")[0];
      var konnekWidget = JSON.parse(localStorage.getItem("konnekWidget"))
        ? JSON.parse(localStorage.getItem("konnekWidget"))
        : {};
      var getKonneksocketusername = konnekWidget.body
        ? konnekWidget.body.username
        : null;
      var getKonneksocketemail = konnekWidget.body
        ? konnekWidget.body.email
        : null;
      var getKonneksocketflag = konnekWidget.flag;
      var getKonneksocketToken = konnekWidget.token;
      // console.log(getKonneksocketflag)

      var validate = false;
      var startChat = false;

      if (self.sso === true) {
        var body = {
          username: document.getElementsByName("wdgt_input_username")[0].value,
          email: document.getElementsByName("wdgt_input_email")[0].value,
        };
        var konnekToken = JSON.stringify({
          body: body,
        });
        localStorage.setItem("konnekWidget", konnekToken);
      } else {
        var username = konnekWidget.body ? konnekWidget.body.username : null;
        var email = konnekWidget.body ? konnekWidget.body.email : null;
      }

      if (self.sso === true) {
        self.usermail = email.value;
        self.username = username.value;
        if (getKonneksocketflag === 0 && getKonneksocketToken !== "") {
          validate = true;
        } else {
          startChat = true;
        }
      } else if (
        self.sso === false &&
        getKonneksocketusername !== null &&
        getKonneksocketusername !== undefined &&
        getKonneksocketemail !== null &&
        getKonneksocketemail !== undefined
      ) {
        self.usermail = getKonneksocketemail;
        self.username = getKonneksocketusername;
        if (getKonneksocketflag === 0 && getKonneksocketToken !== "") {
          validate = true;
        } else {
          startChat = true;
        }
      }
      // else {
      //   localStorage.removeItem("konnekWidget");
      // }

      if (validate == true) {
        var decodedToken = self.parseJwt(getKonneksocketToken);
        // console.log('decodedToken: ', decodedToken)
        self.roomId = decodedToken.data.room_id;
        self.userId = decodedToken.user_id;
        self.sessionId = decodedToken.data.session_id;
        self.socketToken = getKonneksocketToken;

        self.handleSocket(function () {
          self.onclickButton();
        });
        // Open the chat history

        var body = {
          username: self.username,
          email: self.usermail,
        };

        var konnekToken = JSON.stringify({
          body: body,
          flag: 0,
          token: self.socketToken,
        });

        localStorage.setItem("konnekWidget", konnekToken);

        var uploadFile = document.getElementById("upload-file");
        uploadFile.removeAttribute("disabled");

        var frm = document.getElementById("wdgt_init_form");
        frm.remove();
        var wrpInputFormMessage = document.getElementById(
          "wrapper-input-message"
        );
        if (wrpChat.style.display == "none") {
          wrpChat.style.display = "block";
          wrpInputFormMessage.style.display = "block";
        }
        setTimeout(function () {
          self.onclickButton();
          $("#wdgt_chat_icon").trigger("click");
          $("#wdgt_wrapper_chat").scrollTop(
            $("#wdgt_wrapper_chat").prop("scrollHeight")
          );
        }, 1000);
      } else {
        if (startChat === true) {
          var frm = document.getElementById("wdgt_init_form");
          frm.remove();
          self.openWidget(true);
          document.getElementById("wdgt_wrapper_chat").style.display = "block";
        }
      }
    });

    /**
     * --------------------------------------------------------------
     * EVENT LISTENER - Textarea Enter
     * --------------------------------------------------------------
     */
    inputChatForm.addEventListener("keypress", function (e) {
      var key = event.keyCode;
      if (key == 13 && !e.shiftKey) {
        e.preventDefault();
        document.getElementById("send_btn_chat").click();
      }
    });

    /**
     * --------------------------------------------------------------
     * EVENT LISTENER - Chat Icon Button (Circle)
     * --------------------------------------------------------------
     */
    buttonChat.addEventListener("click", function (e) {
      // is chatbox  already open
      var chtBox = document.getElementById("wdgt_chatbox");
      var thisButton = document.getElementById("wdgt_chat_icon");
      // console.log("thisButton", e.type)
      if (chtBox.style.display === "none") {
        // show chat box
        chtBox.style.display = "block";
        // hide button chat
        thisButton.style.display = "none";
        wrapperButtonChat.style.margin = "0";
      } else {
        // show chat box
        chtBox.style.display = "none";
        // hide button chat
        thisButton.style.display = "block";
      }
    });

    /**
     * --------------------------------------------------------------
     * EVENT LISTENER - Chat Box Minimizer
     * --------------------------------------------------------------
     */
    var minimizer = document.getElementById("wdgt_minimize");
    minimizer.addEventListener("click", function () {
      // is chatbox  already open
      var chtBox = document.getElementById("wdgt_chatbox");
      var buttonChat = document.getElementById("wdgt_chat_icon");
      // hide chat box
      chtBox.style.display = "none";
      // show button chat
      buttonChat.style.display = "flex";
      wrapperButtonChat.style.margin = "15px";
    });

    /**
     * --------------------------------------------------------------
     * EVENT LISTENER - Chat Box submit button
     * --------------------------------------------------------------
     */
    var username = document.getElementsByName("wdgt_input_username")[0];
    var email = document.getElementsByName("wdgt_input_email")[0];
    var sbmitForm = document.getElementById("wdgt_submit_form");
    var wrpChat = document.getElementById("wdgt_wrapper_chat");

    this.wrapperChat = wrpChat;

    sbmitForm.addEventListener("click", function (event) {
      event.preventDefault();
      self.isLoading = true;
      sbmitForm.textContent = self.isLoading ? "Loading ..." : "Start Chat";
      sbmitForm.style.disabled = self.isLoading;
      // Hit API Register

      if (username.value != "" && email.value != "") {
        var mailformat = /^\w+([\.-]?\w+)*@\w+([\.-]?\w+)*(\.\w{2,3})+$/;
        var nameformat = /^[a-zA-Z ]{3,}$/;
        if (username.value.match(nameformat)) {
          if (email.value.match(mailformat)) {
            self.usermail = email.value;
            self.username = username.value;
            document.getElementsByClassName("wdgt_email_error")[0].innerHTML =
              "";
            document.getElementsByClassName("wdgt_name_error")[0].innerHTML =
              "";
            if (self.addInfo) {
              var addInfo = [];
              self.addInfo.forEach((entry) => {
                var infoname = document.getElementsByName(entry.name)[0];
                if (entry.type !== null)
                  addInfo.push({
                    title: entry.label,
                    description: infoname.value,
                  });
              });
              var body = {
                email: email.value,
                username: username.value,
                addInfo: addInfo,
              };
            } else {
              var body = {
                email: email.value,
                username: username.value,
              };
            }

            var konnekToken = JSON.stringify({
              body: body,
            });
            localStorage.setItem("konnekWidget", konnekToken);

            var frm = document.getElementById("wdgt_init_form");
            frm.remove();
            var wrpInputFormMessage = document.getElementById(
              "wrapper-input-message"
            );

            if (wrpChat.style.display == "none") {
              wrpChat.style.display = "block";
              wrpInputFormMessage.style.display = "block";
            }

            if (wrpChat === null) {
              /**
               * Generate bubble chat and wrapper it self
               */
              wrpChat = document.createElement("ul");
              wrpChat.setAttribute("id", "wdgt_wrapper_chat");
              wrpChat.style.padding = "1.25rem";
              wrpChat.style.overflowY = "scroll";
              wrpChat.style.height = "100%";
              wrpChat.style.maxHeight = "300px";
              wrpChat.style.listStyle = "none";
              wrpChat.style.margin = 0;
              wrpChat.style.backgroundColor = "#fafafa";
              wrpChat.style.fontFamily = "Ubuntu";

              var bubbleChatDaySeparator = document.createElement("li");
              bubbleChatDaySeparator.setAttribute("class", "title-day");
              bubbleChatDaySeparator.style.fontSize = "12px";
              bubbleChatDaySeparator.style.marginBottom = "1rem";
              bubbleChatDaySeparator.style.fontWeight = "bold";
              bubbleChatDaySeparator.style.color = "#b9bcc6";
              bubbleChatDaySeparator.style.textAlign = "center";
              bubbleChatDaySeparator.innerHTML = "TODAY";
              wrpChat.appendChild(bubbleChatDaySeparator);
            }
          } else {
            self.isLoading = false;
            sbmitForm.textContent = "Start Chat";
            sbmitForm.style.disabled = self.isLoading;
            document.getElementsByClassName("wdgt_email_error")[0].innerHTML =
              "Please enter valid email address!";
            document.getElementsByClassName("wdgt_name_error")[0].innerHTML =
              "";
            // alert("Wrong Email Format")
          }
        } else {
          self.isLoading = false;
          sbmitForm.textContent = "Start Chat";
          sbmitForm.style.disabled = self.isLoading;
          document.getElementsByClassName("wdgt_name_error")[0].innerHTML =
            "Please enter valid username!";
          document.getElementsByClassName("wdgt_email_error")[0].innerHTML = "";
        }
      } else {
        self.isLoading = false;
        sbmitForm.textContent = "Start Chat";
        sbmitForm.style.disabled = self.isLoading;
        if (username.value == "") {
          document.getElementsByClassName("wdgt_name_error")[0].innerHTML =
            "Name is required!";
        } else
          document.getElementsByClassName("wdgt_name_error")[0].innerHTML = "";
        if (email.value == "") {
          document.getElementsByClassName("wdgt_email_error")[0].innerHTML =
            "Email is required!";
        } else
          document.getElementsByClassName("wdgt_email_error")[0].innerHTML = "";
      }
    });

    var btnSendChat = document.getElementById("send_btn_chat");
    if (btnSendChat != null) {
      var self = this;
      btnSendChat.addEventListener("click", function (e) {
        var inputMessage = document.getElementById("input-chat-message");

        var msg = inputMessage.value;
        var konnekWidget = JSON.parse(localStorage.getItem("konnekWidget"));
        var getKonnekToken = konnekWidget.token ? konnekWidget.token : null;
        if (getKonnekToken === null) {
          var body = konnekWidget.body;
          body.text = msg;
          self.requestHTTPAsync(
            {
              method: "POST",
              body: body,
              url: `${self.baseURL}/webhook/widget/${self.clientId}`, // fill this with url get channel config by company_id
            },
            (status, resp) => {
              // replace all
              if (status == 200) {
                var uploadFile = document.getElementById("upload-file");
                uploadFile.removeAttribute("disabled");

                var messageStruct = {
                  msg_id: self.generateUUID(),
                  from_type: 2,
                  text: msg,
                  chat_id: self.usermail,
                  date: moment().format(),
                };
                self.generateCustomerMessage(self.wrapperChat, messageStruct);
                $(".far.fa-clock").attr(
                  "idd",
                  "status-" + messageStruct.msg_id
                );

                localStorage.setItem("messageStruct", JSON.stringify(messageStruct));

                // $(".far.fa-clock")
                //   .filter('[idd="status-' + messageStruct.msg_id + '"]')
                //   .removeClass("far fa-clock")
                //   .addClass("far fa-check-double");

                resp = JSON.parse(resp).data;
                var decodedToken = self.parseJwt(resp.token);
                self.roomId = decodedToken.data.room_id;
                self.userId = decodedToken.user_id;
                self.sessionId = decodedToken.data.session_id;
                self.socketToken = resp.token;
                self.handleSocket(self.onclickButton());
                konnekWidget.flag = 0;
                konnekWidget.token = self.socketToken;
                localStorage.setItem(
                  "konnekWidget",
                  JSON.stringify(konnekWidget)
                );
              }
            }
          );
        } else {
          if (self.fileMediaUpload) {
            self.handleUploadMedia(self.fileMediaUpload, inputMessage.value)
            wrapperContentMediaBase64.style.display = "none"
            contentImageBase64.src = ''
            contentDescriptionImageBase64.textContent = ''
            self.fileMediaUpload = false;
          } else {
            self.sendMessage(msg);
          }
        }
        inputMessage.value = "";
      });
    }
  }

  downloadImage(e) {
    fetch(e)
      .then((resp) => resp.blob())
      .then((blob) => {
        const url = window.URL.createObjectURL(blob);
        const a = document.createElement("a");
        a.style.display = "none";
        a.href = url;
        let name = e.split("/").pop();
        a.download = name;
        document.body.appendChild(a);
        a.click();
        window.URL.revokeObjectURL(url);
      });
  }

  generateUUID() {
    // Public Domain/MIT
    var d = new Date().getTime(); //Timestamp
    var d2 =
      (typeof performance !== "undefined" &&
        performance.now &&
        performance.now() * 1000) ||
      0; //Time in microseconds since page-load or 0 if unsupported
    return "xxxxxxxx-xxxx-4xxx-yxxx-xxxxxxxxxxxx".replace(
      /[xy]/g,
      function (c) {
        var r = Math.random() * 16; //random number between 0 and 16
        if (d > 0) {
          //Use timestamp until depleted
          r = (d + r) % 16 | 0;
          d = Math.floor(d / 16);
        } else {
          //Use microseconds since page-load if supported
          r = (d2 + r) % 16 | 0;
          d2 = Math.floor(d2 / 16);
        }
        return (c === "x" ? r : (r & 0x3) | 0x8).toString(16);
      }
    );
    // document.getElementById('this.generateUUID()').textContent = generatethis.generateUUID()();
  }

  generateBotMessage(wrapper, message, media) {
    var parsingTextJson;
    var parsingJSON;
    var self = this;
    try {
      if (self.csatText === true && message.type === "text") {
        parsingJSON = message.text;
      } else {
        parsingJSON = JSON.parse(media) ? JSON.parse(media) : message.text;
        media = JSON.parse(media) ? JSON.parse(media) : media;
      }

      if (typeof parsingJSON === "number") {
        parsingTextJson = parseString(parsingJSON);
      } else {
        parsingTextJson = parsingJSON;
      }
    } catch (err) {
      parsingTextJson = message.text;
    }

    // console.log("parsingTextJson: ", parsingTextJson);

    var bubbleChat = document.createElement("li");
    var rowBuble = document.createElement("div");
    rowBuble.setAttribute("class", "wdgt-row");
    rowBuble.style.boxSizing = "border-box";
    rowBuble.style.display = "flex";

    // avatar image
    var divBubbleAvatarImage = document.createElement("div");
    divBubbleAvatarImage.setAttribute("class", "wdgt-col-md-2");
    // divBubbleAvatarImage.style.maxWidth = "16.666667%"

    var spanWrapperBubbleAvatarImage = document.createElement("span");
    spanWrapperBubbleAvatarImage.setAttribute(
      "class",
      "wdgt-ant-avatar wdgt-ant-avatar-circle wdgt-ant-avatar-image wdgt-mr-2"
    );
    spanWrapperBubbleAvatarImage.style.width = "30px";
    spanWrapperBubbleAvatarImage.style.height = "30px";
    spanWrapperBubbleAvatarImage.style.lineHeight = "30px";
    spanWrapperBubbleAvatarImage.style.fontSize = "18px";
    spanWrapperBubbleAvatarImage.style.marginRight = "0.5rem";
    spanWrapperBubbleAvatarImage.innerHTML = `<img style='width:45px; height:15px; border-radius: 1px; max-width:none;' src='${this.botImage}' />`;
    divBubbleAvatarImage.appendChild(spanWrapperBubbleAvatarImage);
    rowBuble.appendChild(divBubbleAvatarImage);

    // avatar message
    var divBubbleAvatarMessage = document.createElement("div");
    divBubbleAvatarMessage.setAttribute("class", "wdgt-col-md-8");
    divBubbleAvatarMessage.style.maxWidth = "100%";

    var divBubbleAvatarEachMessage = document.createElement("div");
    divBubbleAvatarEachMessage.setAttribute("class", "mb-2 bubble-widget-from");
    divBubbleAvatarEachMessage.style.lineHeight = "1.5715";
    divBubbleAvatarEachMessage.style.marginBottom = "0.5rem";
    divBubbleAvatarEachMessage.style.position = "relative";
    divBubbleAvatarEachMessage.style.display = "flex";
    divBubbleAvatarEachMessage.style.flexDirection = "column";
    divBubbleAvatarEachMessage.style.backgroundColor = "#E8E8EB";
    divBubbleAvatarEachMessage.style.border =
      "solid 1px rgba(151, 151, 151, 0.2)";
    divBubbleAvatarEachMessage.style.padding =
      typeof parsingTextJson === "object" ? "0 0 12px 0" : "13px 12px 11px";
    divBubbleAvatarEachMessage.style.borderRadius = "8px";
    divBubbleAvatarEachMessage.style.width = "90%";
    divBubbleAvatarEachMessage.style.float = "left";

    var divBubbleAvatarEachContentMessage = document.createElement("div");
    // divBubbleAvatarEachContentMessage.setAttribute("class","d-flex justify-content-between align-items-center")
    divBubbleAvatarEachContentMessage.style.alignItems =
      media && message.text ? "" : "center";
    divBubbleAvatarEachContentMessage.style.justifyContent =
      media && message.text ? "" : "space-between";
    divBubbleAvatarEachContentMessage.style.display =
      media && message ? "" : "";
    divBubbleAvatarEachContentMessage.style.fontSize = "13px";
    divBubbleAvatarEachContentMessage.style.whiteSpace = "pre-line";
    // divBubbleAvatarEachContentMessage.style.margin = "auto";
    divBubbleAvatarEachContentMessage.style.marginRight = "10px";
    divBubbleAvatarEachContentMessage.style.marginLeft = "10px";

    /**
     * --------------------------------------------------------------
     * INSERT CONTENT - Content Image & Content Icon Download
     * --------------------------------------------------------------
     */

    var divWrapperMedia = document.createElement("div");
    divWrapperMedia.setAttribute("class", "image-wrapper");
    divWrapperMedia.style.display = "flex";
    divWrapperMedia.style.justifyContent = "space-between";
    divWrapperMedia.style.alignItems = "flex-start";
    divWrapperMedia.style.marginBottom = "10px";

    var imageContentMessage = document.createElement("img");
    imageContentMessage.setAttribute("alt", "icon-media");

    if (media && media.url !== undefined) {
      // console.log("media", media);
      imageContentMessage.setAttribute(
        "src",
        this.patternMedia.some((item) => media.url.includes(item))
          ? media.url
          : `${this.baseURLMedia}/assets/images/ic-file.svg`
      );
      imageContentMessage.addEventListener("click", function (e) {
        window.open(media.url, "_blank");
      });
    }
    imageContentMessage.style.width = "70px";
    imageContentMessage.style.height = "auto";
    imageContentMessage.style.objectFit = "cover";
    imageContentMessage.style.display = "block";
    imageContentMessage.style.marginLeft = "10%";
    imageContentMessage.style.cursor = "pointer";
    divWrapperMedia.appendChild(imageContentMessage);

    var btnDownload = document.createElement("button");
    var self = this;
    btnDownload.addEventListener("click", function (e) {
      self.downloadImage(media.url);
    });

    var imageDownload = document.createElement("img");
    imageDownload.setAttribute("alt", "icon-download");
    imageDownload.setAttribute(
      "src",
      `${this.baseURLMedia}/assets/images/ic-download.svg`
    );
    imageDownload.style.width = "15px";
    imageDownload.style.height = "auto";
    imageDownload.style.cursor = "pointer";
    imageDownload.style.display = "block";

    btnDownload.appendChild(imageDownload);
    divWrapperMedia.appendChild(btnDownload);

    if (media && media.url !== undefined) {
      divBubbleAvatarEachContentMessage.appendChild(divWrapperMedia);
    }

    /**
     * --------------------------------------------------------------
     * INSERT CONTENT - Content Message & Content Message Time
     * --------------------------------------------------------------
     */

    var divWrapperContentMessage = document.createElement("div");
    divWrapperContentMessage.style.display =
      typeof parsingTextJson === "object" ? "block" : "flex"; // change to block if content is button or carousel
    divWrapperContentMessage.style.justifyContent = "space-between";
    divWrapperContentMessage.style.alignItems = "flex-end";
    divWrapperContentMessage.style.width = "100%";

    var divSectionContentMessage = document.createElement("span");
    divSectionContentMessage.innerText = message.text ? message.text : message;
    divSectionContentMessage.style.wordBreak = "break-word";
    divSectionContentMessage.style.width = "100%";

    if (typeof parsingTextJson === "string") {
      divWrapperContentMessage.appendChild(divSectionContentMessage);
    }

    var divSectionContentMessageTime = document.createElement("span");
    divSectionContentMessageTime.innerText = message.processed_at
      ? moment(message.processed_at).format("HH:mm")
      : "-";
    divSectionContentMessageTime.style.alignSelf = "flex-end";
    divSectionContentMessageTime.style.color = "#b9bcc6";
    divSectionContentMessageTime.style.float = "right";
    divSectionContentMessageTime.style.marginRight =
      typeof parsingTextJson === "object" ? "10px" : "";

    /**
     * --------------------------------------------------------------
     * INSERT CONTENT - Content Message Button
     * --------------------------------------------------------------
     */

    var divWrapperContentButton = document.createElement("div");

    var divSectionContentTitleButton = document.createElement("p");
    divSectionContentTitleButton.style.margin = "0";
    divSectionContentTitleButton.style.backgroundColor = "#f5f5f5";
    divSectionContentTitleButton.style.borderTopLeftRadius = "8px";
    divSectionContentTitleButton.style.borderTopRightRadius = "8px";
    divSectionContentTitleButton.style.padding = "10px";

    var divSectionContentButton = document.createElement("button");
    divSectionContentButton.setAttribute("class", "btn-option");
    divSectionContentButton.style.padding = "10px";
    divSectionContentButton.style.width = "100%";
    divSectionContentButton.style.textAlign = "center";
    divSectionContentButton.style.fontFamily = "'Ubuntu'";
    divSectionContentButton.style.fontSize = "12px";
    divSectionContentButton.style.border = "none";
    divSectionContentButton.style.cursor = "pointer";
    divSectionContentButton.style.backgroundColor = "#F9FAFB";

    var divSectionContentButtonCarousel = document.createElement("button");
    divSectionContentButtonCarousel.setAttribute(
      "class",
      "btn-option-carousel"
    );
    divSectionContentButtonCarousel.style.padding = "10px";
    divSectionContentButtonCarousel.style.width = "100%";
    divSectionContentButtonCarousel.style.textAlign = "center";
    divSectionContentButtonCarousel.style.fontFamily = "'Ubuntu'";
    divSectionContentButtonCarousel.style.fontSize = "12px";
    divSectionContentButtonCarousel.style.border = "none";
    divSectionContentButtonCarousel.style.cursor = "pointer";
    divSectionContentButtonCarousel.style.backgroundColor = "#F9FAFB";

    // Section add hover for button option
    $(document).ready(function () {
      $(".btn-option").hover(
        function () {
          $(this).css("background-color", "#f5f5f5");
        },
        function () {
          $(this).css("background-color", "#F9FAFB");
        }
      );

      $(".btn-option-carousel").hover(
        function () {
          $(this).css("background-color", "#f5f5f5");
        },
        function () {
          $(this).css("background-color", "#F9FAFB");
        }
      );

      $(".btn-url").hover(
        function () {
          $(this).css("background-color", "#f5f5f5");
        },
        function () {
          $(this).css("background-color", "#F9FAFB");
        }
      );
    });

    /**
     * --------------------------------------------------------------
     * INSERT CONTENT - Content Message Carousel
     * --------------------------------------------------------------
     */

    var divWrapperCarousel = document.createElement("div");
    divWrapperCarousel.setAttribute("class", "item-carousel");

    var divWrapperContentCarousel = document.createElement("div");
    divWrapperContentCarousel.style.padding = "10px";
    divWrapperContentCarousel.style.margin = "0 15px";
    divWrapperContentCarousel.setAttribute("style", "width: 100% !important");

    var divSectionContentCarousel = document.createElement("img");
    divSectionContentCarousel.setAttribute("alt", "icon-download");
    divSectionContentCarousel.style.width = "100%";
    divSectionContentCarousel.style.height = "120px";
    divSectionContentCarousel.style.maxHeight = "120px";
    divSectionContentCarousel.style.objectFit = "cover";
    divSectionContentCarousel.style.borderRadius = "7px";
    divWrapperContentCarousel.appendChild(divSectionContentCarousel);

    var divWrapperContentMessageCarousel = document.createElement("div");
    divWrapperContentMessageCarousel.style.padding = "10px";
    divWrapperContentMessageCarousel.style.backgroundColor = "#f5f5f5";

    var divSectionContentTitleCarousel = document.createElement("p");
    divSectionContentTitleCarousel.style.fontWeight = "bold";
    divSectionContentTitleCarousel.style.margin = "0";

    var divSectionContentDescriptionCarousel = document.createElement("p");
    divSectionContentDescriptionCarousel.style.marginBottom = "0";

    var linkURL = document.createElement("a");
    linkURL.setAttribute("target", "_blank");
    linkURL.setAttribute("class", "btn-url");
    linkURL.style.padding = "10px";
    linkURL.style.display = "block";
    linkURL.style.textAlign = "center";
    linkURL.style.fontFamily = "'Ubuntu'";
    linkURL.style.fontSize = "12px";
    linkURL.style.border = "none";
    linkURL.style.cursor = "pointer";
    linkURL.style.backgroundColor = "#F9FAFB";
    linkURL.style.textDecoration = "none";
    linkURL.style.color = "black";

    if (typeof parsingTextJson === "object") {
      var dataParse = parsingTextJson;
      var self = this;

      if (message.type === "button") {
        divWrapperContentButton.style.marginBottom = "10px";
        divSectionContentTitleButton.innerText = message.text;
        divWrapperContentButton.appendChild(divSectionContentTitleButton);

        dataParse.body.map((data, index) => {
          if (data.type == "url") {
            linkURL.setAttribute("href", data.url);
            linkURL.textContent = data.title;
            divWrapperContentButton.innerHTML += linkURL.outerHTML;
          } else {
            divSectionContentButton.textContent = data.title;
            divSectionContentButton.setAttribute(
              "action",
              JSON.stringify(data)
            );
            divWrapperContentButton.innerHTML +=
              divSectionContentButton.outerHTML;
          }
        });
        $(document).ready(function () {
          $(document).off("click", ".btn-option");
          $(document).on("click", ".btn-option", function () {
            var attrAction = $(this).attr("action");
            var attrParse = JSON.parse(attrAction);
            var formData = {
              username: self.usermail,
              payload: attrParse,
            };

            self.handlePostback(formData);
          });
        });
      } else if (message.type === "carousel") {
        divBubbleAvatarEachMessage.style.backgroundColor = "rgb(245, 245, 245)";
        divBubbleAvatarEachMessage.style.color = "#000";

        divWrapperContentMessageCarousel.appendChild(
          divSectionContentTitleCarousel
        );
        divWrapperContentMessageCarousel.appendChild(
          divSectionContentDescriptionCarousel
        );
        divWrapperContentCarousel.appendChild(divWrapperContentMessageCarousel);
        divWrapperContentCarousel.appendChild(divSectionContentButtonCarousel);

        dataParse.body.map((data) => {
          data.actions.map((item) => {
            divSectionContentButtonCarousel.textContent = item.title;
            divSectionContentButtonCarousel.setAttribute(
              "action",
              JSON.stringify(item)
            );
          });
          divSectionContentCarousel.setAttribute("src", data.media_url);
          divSectionContentTitleCarousel.innerText = data.title;
          divSectionContentDescriptionCarousel.innerText = data.description;
          divWrapperCarousel.innerHTML += divWrapperContentCarousel.outerHTML; // Section Carousel
        });

        $(document).ready(function () {
          setTimeout(function () {
            $(".item-carousel").not(".slick-initialized").slick({
              infinite: true,
              slidesToShow: 1,
              slidesToScroll: 1,
              centerPadding: "20px",
              className: "center",
              centerMode: true,
              nextArrow: `<img class='slick-next' style='position: absolute; top: 40%; left: 85%; z-index: 100; cursor: pointer; width: 7%; padding: 3px; border: 1px solid #ffffff; border-radius: 50%; background-color: #ffffff; box-shadow: 0px 0px 7px 2px rgb(0 0 0 / 20%);' src='https://media.wekonnek.id/konnek/widget/assets/images/ic-arrow-right.png'>`,
              prevArrow: `<img class='slick-prev' style='position: absolute; top: 40%; right: 85%; z-index: 100; cursor: pointer; width: 7%; padding: 3px; border: 1px solid #ffffff; border-radius: 50%; background-color: #ffffff; box-shadow: 0px 0px 7px 2px rgb(0 0 0 / 20%);' src='https://media.wekonnek.id/konnek/widget/assets/images/ic-arrow-left.png'>`,
            });

            $(".btn-option-carousel")
              .unbind()
              .click(function () {
                var activeClass = $(".slick-slide").hasClass("slick-active");

                if (activeClass) {
                  var attrAction = $(this).attr("action");
                  var attrParse = JSON.parse(attrAction);
                  var formData = {
                    username: self.usermail,
                    payload: attrParse,
                  };

                  self.handlePostback(formData);
                }
              });
          }, 1000);
        });
      } else if (message.type === "image") {
        imageContentMessage.setAttribute("src", dataParse.url);
        imageContentMessage.style.width = "70px";
        imageContentMessage.style.height = "auto";
        imageContentMessage.style.objectFit = "cover";
        imageContentMessage.style.display = "block";
        imageContentMessage.style.cursor = "pointer";
        imageContentMessage.addEventListener("click", function (e) {
          window.open(dataParse.url, "_blank");
        });
        divWrapperMedia.appendChild(imageContentMessage);

        divWrapperMedia.style.padding = "13px 12px 11px";
        divWrapperMedia.style.flexDirection = "row-reverse";
        divBubbleAvatarEachContentMessage.appendChild(divWrapperMedia);

        var divSectionContentMessage = document.createElement("span");
        // divSectionContentMessage.style.marginLeft = "10%";
        var fileNameCaption = typeof parsingTextJson === "object"
            ? parsingTextJson.name
            : parsingTextJson;
        if (message.text === "") {
          divSectionContentMessage.innerText = fileNameCaption
          
        } else {
          divSectionContentMessage.innerText = fileNameCaption + "\n" + message.text
        }
        
        // divSectionContentMessage.style.display = "inline-grid"
        // divSectionContentMessage.style.justifyContent = "space-around"
        // divSectionContentMessage.style.alignItems = "stretch"
        divSectionContentMessage.style.wordBreak = "break-word";
        divSectionContentMessage.style.width = "100%";
        divBubbleAvatarEachContentMessage.appendChild(divSectionContentMessage);
      } else {
        divWrapperMedia.style.padding = "13px 12px 11px";
        // divWrapperMedia.style.flexDirection = "row-reverse";  // NYALAKAN JIKA INGIN TOMBOL DOWNLOAD DI KIRI
        divBubbleAvatarEachContentMessage.appendChild(divWrapperMedia);

        var divSectionContentMessage = document.createElement("span");
        var fileNameCaption = typeof parsingTextJson === "object"
            ? parsingTextJson.name
            : parsingTextJson;
        if (message.text === "") {
          divSectionContentMessage.innerText = fileNameCaption
        } else {
          divSectionContentMessage.innerText = fileNameCaption + "\n" + message.text
        }
        
        divSectionContentMessage.style.wordBreak = "break-word";
        divSectionContentMessage.style.width = "100%";
        divBubbleAvatarEachContentMessage.appendChild(divSectionContentMessage);
      }
    }

    divWrapperContentMessage.appendChild(divWrapperCarousel); // Carousel Option

    divWrapperContentMessage.appendChild(divWrapperContentButton); // Button Option

    divWrapperContentMessage.appendChild(divSectionContentMessageTime);

    divBubbleAvatarEachContentMessage.appendChild(divWrapperContentMessage);

    divBubbleAvatarEachMessage.appendChild(divBubbleAvatarEachContentMessage);

    divBubbleAvatarMessage.appendChild(divBubbleAvatarEachMessage);

    rowBuble.appendChild(divBubbleAvatarMessage);

    bubbleChat.appendChild(rowBuble);

    wrapper.appendChild(bubbleChat);
    this.wrapperChat.scrollTop = this.wrapperChat.scrollHeight;
  }
  //ntar dulu
  generateCustomerMessage(wrapper, message, media) {
    var parsingTextJson;
    var parsingJSON;
    try {
      parsingJSON = JSON.parse(message.payload)
        ? JSON.parse(message.payload)
        : message.text;
      media = JSON.parse(media) ? JSON.parse(media) : media;
      if (typeof parsingJSON === "number") {
        parsingTextJson = parseString(parsingJSON);
      } else {
        parsingTextJson = parsingJSON;
      }
    } catch (err) {
      parsingTextJson = message.text;
    }
    var bubbleChat = document.createElement("li");
    var rowBuble = document.createElement("div");
    rowBuble.setAttribute("class", "wdgt-row");
    rowBuble.style.boxSizing = "border-box";
    rowBuble.style.display = "flex";

    var divBubbleCustomerImage = document.createElement("div");
    divBubbleCustomerImage.setAttribute("class", "wdgt-col-md-2");
    divBubbleCustomerImage.style.maxWidth = "16.666667%";

    var spanWrapperBubbleCustomerImage = document.createElement("span");
    spanWrapperBubbleCustomerImage.setAttribute(
      "class",
      "wdgt-ant-avatar wdgt-ant-avatar-circle wdgt-ant-avatar-image wdgt-mr-2"
    );
    spanWrapperBubbleCustomerImage.style.width = "30px";
    spanWrapperBubbleCustomerImage.style.height = "30px";
    spanWrapperBubbleCustomerImage.style.lineHeight = "30px";
    spanWrapperBubbleCustomerImage.style.fontSize = "18px";
    spanWrapperBubbleCustomerImage.style.marginRight = "0.5rem";
    // spanWrapperBubbleCustomerImage.innerHTML = `<img style='width:40px; height:40px; border-radius: 20px;' src='https://media.wekonnek.id/konnek/widget/assets/images/icon-customer.png' />`
    divBubbleCustomerImage.appendChild(spanWrapperBubbleCustomerImage);

    // customer message
    var divBubbleCustomerMessage = document.createElement("div");
    divBubbleCustomerMessage.setAttribute("class", "wdgt-col-md-8");
    divBubbleCustomerMessage.style.maxWidth = "100%";
    divBubbleCustomerMessage.style.marginLeft = "auto";
    divBubbleCustomerMessage.style.marginBottom = "1rem";
    spanWrapperBubbleCustomerImage.appendChild(divBubbleCustomerMessage);

    var divBubbleCustomerEachMessage = document.createElement("div");
    divBubbleCustomerEachMessage.setAttribute(
      "class",
      "mb-2 bubble-widget-to card1"
    );
    divBubbleCustomerEachMessage.style.lineHeight = "1.5715";
    divBubbleCustomerEachMessage.style.marginBottom = "0.5rem";
    divBubbleCustomerEachMessage.style.position = "relative";
    divBubbleCustomerEachMessage.style.display = "flex";
    divBubbleCustomerEachMessage.style.flexDirection = "column";
    divBubbleCustomerEachMessage.style.padding = "13px 13px 13px";
    divBubbleCustomerEachMessage.style.borderRadius = "8px";
    divBubbleCustomerEachMessage.style.maxwidth = "90%";
    divBubbleCustomerEachMessage.style.marginRight = "10px";
    divBubbleCustomerEachMessage.style.float = "right";
    divBubbleCustomerEachMessage.style.whiteSpace = "pre-line";
    divBubbleCustomerEachMessage.style.backgroundColor = this.headerBackground;
    divBubbleCustomerEachMessage.style.color = this.headerTextColor;
    divBubbleCustomerMessage.appendChild(divBubbleCustomerEachMessage);

    var divBubbleCustomerEachContentMessage = document.createElement("div");
    // divBubbleCustomerEachContentMessage.setAttribute("class","d-flex justify-content-between align-items-center")
    divBubbleCustomerEachContentMessage.style.alignItems =
      media && message.text ? "" : "center";
    divBubbleCustomerEachContentMessage.style.justifyContent =
      media && message.text ? "" : "space-between";
    divBubbleCustomerEachContentMessage.style.display =
      media && message.text ? "" : "";
    divBubbleCustomerEachContentMessage.style.fontSize = "13px";

    /**
     * --------------------------------------------------------------
     * INSERT CONTENT - Content Image & Content Icon Download
     * --------------------------------------------------------------
     */

    var divWrapperMedia = document.createElement("div");
    divWrapperMedia.setAttribute("class", "image-wrapper");
    divWrapperMedia.style.display = "flex";
    divWrapperMedia.style.justifyContent = "space-between";
    divWrapperMedia.style.alignItems = "flex-start";
    divWrapperMedia.style.marginBottom = "10px";

    var imageContentMessage = document.createElement("img");
    imageContentMessage.setAttribute("alt", "icon-media");
    if (media && media.url !== undefined) {
      imageContentMessage.setAttribute(
        "src",
        this.patternMedia.some((item) => media.url.includes(item))
          ? media.url
          : `${this.baseURLMedia}/assets/images/ic-file.svg`
      );
      imageContentMessage.addEventListener("click", function (e) {
        window.open(media.url, "_blank");
      });
    }

    imageContentMessage.style.width = "70px";
    imageContentMessage.style.height = "auto";
    imageContentMessage.style.objectFit = "cover";
    imageContentMessage.style.display = "block";
    imageContentMessage.style.cursor = "pointer";
    divWrapperMedia.appendChild(imageContentMessage);

    var divimageContentMessage = document.createElement("div");
    divimageContentMessage.style.display = "";
    divimageContentMessage.style.justifyContent = "space-between";
    divimageContentMessage.style.alignItems = "flex-end";

    imageContentMessage.appendChild(divimageContentMessage);

    var divSectionImageContentMessage = document.createElement("span");
    divSectionImageContentMessage.innerText =
      typeof parsingTextJson === "object"
        ? parsingTextJson.name
        : parsingTextJson;
    divSectionImageContentMessage.style.wordBreak = "break-word";
    divSectionImageContentMessage.style.marginLeft = "10px"
    divSectionImageContentMessage.style.width = "100%";
    divimageContentMessage.appendChild(divSectionImageContentMessage);

    var btnDownload = document.createElement("button");
    var self = this;
    btnDownload.addEventListener("click", function (e) {
      self.downloadImage(media.url);
    });

    var imageDownload = document.createElement("img");
    imageDownload.setAttribute("alt", "icon-download");
    imageDownload.setAttribute(
      "src",
      `${this.baseURLMedia}/assets/images/ic-download.svg`
    );
    imageDownload.style.width = "15px";
    imageDownload.style.height = "auto";
    imageDownload.style.cursor = "pointer";
    imageDownload.style.display = "block";

    btnDownload.appendChild(imageDownload);
    divWrapperMedia.appendChild(btnDownload);
    // console.log("message.media",message.media)
    if (media && media.url !== undefined) {
      divBubbleCustomerEachContentMessage.appendChild(divWrapperMedia);
    }

    /**
     * --------------------------------------------------------------
     * INSERT CONTENT - Content Message & Content Message Time
     * --------------------------------------------------------------
     */

    var divWrapperContentMessage = document.createElement("div");
    divWrapperContentMessage.setAttribute("class", "test11");
    divWrapperContentMessage.style.display = "";
    divWrapperContentMessage.style.justifyContent = "space-between";
    divWrapperContentMessage.style.alignItems = "flex-end";

    var divSectionContentMessage = document.createElement("span");
    divSectionContentMessage.innerText =
      typeof parsingTextJson === "object"
        ? message.type === "postback" ? parsingTextJson.title :  parsingTextJson.name
        : parsingTextJson;
    divSectionContentMessage.style.wordBreak = "break-word";
    divSectionContentMessage.style.width = "100%";
    divWrapperContentMessage.appendChild(divSectionContentMessage);

    var divSectionContentMessageTime = document.createElement("span");
    divSectionContentMessageTime.innerText = message.date
      ? moment(message.message_time).format("HH:mm")
      : "-";
    divSectionContentMessageTime.style.alignSelf = "flex-end";
    divSectionContentMessageTime.style.color = "#b9bcc6";
    divSectionContentMessageTime.style.float = "right";
    divSectionContentMessageTime.style.marginLeft = "10px";

    var divSectionContentMessageTimeIcon = document.createElement("span");
    divSectionContentMessageTimeIcon.setAttribute("class", "far fa-clock");
    divSectionContentMessageTimeIcon.setAttribute(
      "id",
      "status-" + new Date().getTime()
    );
    divSectionContentMessageTimeIcon.style.alignSelf = "flex-end";
    divSectionContentMessageTimeIcon.innerHtml = "&#xf017;";
    divSectionContentMessageTimeIcon.style.color = "#b9bcc6";
    divSectionContentMessageTimeIcon.style.float = "right";
    divSectionContentMessageTimeIcon.style.marginLeft = "10px";
    divSectionContentMessageTimeIcon.style.marginTop = "3px";

    divWrapperContentMessage.appendChild(divSectionContentMessageTimeIcon);
    divWrapperContentMessage.appendChild(divSectionContentMessageTime);
    divBubbleCustomerEachContentMessage.appendChild(divWrapperContentMessage);

    var divSectionContentMessageMedia = document.createElement("div");
    divSectionContentMessageMedia.innerText = message.label
      ? message.label
      : "";
    divSectionContentMessageMedia.style.justifyContent = "space-between";
    divSectionContentMessageMedia.style.alignItems = "flex-end";
    divSectionContentMessageMedia.style.wordBreak = "break-word";
    divSectionContentMessageMedia.style.width = "100%";
    divBubbleCustomerEachContentMessage.appendChild(
      divSectionContentMessageMedia
    );

    divBubbleCustomerEachMessage.appendChild(
      divBubbleCustomerEachContentMessage
    );

    divBubbleCustomerMessage.appendChild(divBubbleCustomerEachMessage);

    rowBuble.appendChild(divBubbleCustomerMessage);
    rowBuble.appendChild(divBubbleCustomerImage);

    bubbleChat.appendChild(rowBuble);

    wrapper.appendChild(bubbleChat);

    this.wrapperChat.scrollTop = this.wrapperChat.scrollHeight;
  }

  /**
   * --------------------------------------------------------------
   * UPLOAD MEDIA
   * --------------------------------------------------------------
   * Post media (image/file) via API
   * --------------------------------------------------------------
   */

  handleUploadMedia(fileUpload, msg) {
    var inputMessage = document.getElementById("input-chat-message");
    var self = this;
    var forms = new FormData();
    var wrpInputFormMessage = document.getElementById("wrapper-input-message");
    self.loading = true;
    var uuid = this.generateUUID();

    forms.append("media", fileUpload);
    forms.append("message_id", uuid);
    forms.append("reply_id", "");

    if (msg == "") {
      forms.append("text", fileUpload.name);
    } else {
      forms.append("text", msg);
    }
    
    forms.append("time", moment().format());

    var messageStruct = {
      msg_id: uuid,
      from_type: 1,
      text: fileUpload.name,
      payload: {
        url: wrpInputFormMessage.src,
        name: fileUpload.name,
      },
      chat_id: self.email,
      date: moment().format(),
      label: msg,
    };

    self.generateCustomerMessage(
      self.wrapperChat,
      messageStruct,
      messageStruct.payload
    );
    $(".far.fa-clock").attr("idd", "status-" + messageStruct.msg_id);

    this.requestHTTPAsync(
      {
        headers: {
          "Access-Control-Allow-Origin": "*",
        },
        body: forms,
        method: "POST",
        url: `${this.baseURL}/chat/media`,
      },
      (status, resp) => {
        if (resp.meta.status == true) {
          self.loading = false;
          $(".far.fa-clock")
            .filter('[idd="status-' + messageStruct.msg_id + '"]')
            .removeClass("far fa-clock")
            .addClass("far fa-check-double");
        } else {
          $(".far.fa-clock")
            .filter('[idd="status-' + messageStruct.msg_id + '"]')
            .removeClass("far fa-clock")
            .addClass("far fa-times");
        }
      },
      self.socketToken
    );
  }

  /**
   * --------------------------------------------------------------
   * POSTBACK MESSAGE
   * --------------------------------------------------------------
   * Post message (message/postback) via API
   * --------------------------------------------------------------
   */

  handlePostback(dataMessage) {
    // console.log("dataMessage", dataMessage);
    var self = this;
    var konnekWidget = JSON.parse(localStorage.getItem("konnekWidget"));

    var emitObject = {
      message_id: this.generateUUID(),
      reply_id: null,
      ttl: 5,
      time: moment().format(),
      type: "postback", //text/postback
      text: dataMessage.payload.title,
      postback: dataMessage.payload,
    };

    var messageStruct = {
      msg_id: emitObject.message_id,
      from_type: 1,
      text: emitObject.text,
      chat_id: dataMessage.username,
      date: emitObject.time,
    };

    self.generateCustomerMessage(self.wrapperChat, messageStruct);
    $(".far.fa-clock").attr("idd", "status-" + messageStruct.msg_id);
    this.socket.emit(
      "chat",
      emitObject,
      self.withTimeout(
        (response) => {
          // console.log("emitObject", emitObject);
          // console.log("response", response);
          $(".far.fa-clock")
            .filter('[idd="status-' + messageStruct.msg_id + '"]')
            .removeClass("far fa-clock")
            .addClass("far fa-check-double");
        },
        () => {
          $(".far.fa-clock")
            .filter('[idd="status-' + messageStruct.msg_id + '"]')
            .removeClass("far fa-clock")
            .addClass("far fa-times");
        },
        emitObject.ttl * 1000
      )
    );
  }

  /**
   * --------------------------------------------------------------
   * GET CONFIG
   * --------------------------------------------------------------
   * Get config client via API
   * --------------------------------------------------------------
   */
  getConfig(callback) {
    this.requestHTTPAsync(
      {
        method: "GET",
        url: `${this.baseURL}/channel/config/${this.clientId}/web`, // fill this with url get channel config by company_id
      },
      (status, resp) => {
        // replace all
        if (status == 200) {
          // console.log("response", JSON.parse(resp));
          callback(true, JSON.parse(resp));
        }
      },
      this.socketToken
    );
  }

  getConversation(callback, pages) {
    this.requestHTTPAsync(
      {
        method: "GET",
        url: `${this.baseURL}/room/conversation/${this.roomId}?page=1&limit=20&session_id=${this.sessionId}`,
      },
      (status, resp) => {
        // replace all
        if (status == 200) {
          // console.log('callback: ', callback)
          callback(true, JSON.parse(resp));
        }
      },
      this.socketToken
    );
  }

  handleSocket() {
    const tokenCode = this.socketToken;

    if (this.socket) {
      this.socket.disconnect();
    }

    var socket = io(`${this.baseURLSocket}`, {
      reconnectionDelayMax: 10000,
      transportOptions: {
        polling: {
          extraHeaders: {
            Authorization: tokenCode,
          },
        },
      },
    });

    socket.on("connect_error", (err) => {
      console.log(`connect_error due to ${err.message}`);
      if (err.message == "Unauthorized") {
        localStorage.removeItem("konnekWidget");
        var uploadFile = document.getElementById("upload-file");
        uploadFile.setAttribute("disabled", "");

        location.reload()
      }
    });

    this.socket = socket;
    var self = this;
    this.socket.on("disconnect", function () {
      console.log("diconnected");
    });
    this.socket.on("connect", function () {
      self.getConversation(function (success, resp) {
        if (resp.data.room.status == "-1") {
          self.openWidget();
        } else {

          var messageStruct = JSON.parse(localStorage.getItem("messageStruct"));
          if (messageStruct != null) {
            var getMessageId = messageStruct.msg_id ? messageStruct.msg_id : null;
            $(".far.fa-clock")
              .filter('[idd="status-' + getMessageId + '"]')
              .closest("li")
              .remove()
          }
          
          self.metaData = resp.data;

          var conversations = resp.data.conversations.map((item) => ({
            ...item,
            date: new Date(moment(item.message_time).format()),
          }));

          const groups = conversations.reduce((groups, index) => {
            const time = moment(index.date).format("DD-MM-YYYY");
            if (!groups[time]) {
              groups[time] = [];
            }
            groups[time].push(index);
            return groups;
          }, {});

          const groupArrays2 = Object.keys(groups).map((date) => {
            return {
              date,
              messages: groups[date].reverse(),
            };
          });

          var groupArrays = groupArrays2.reverse()

          var wrpChat = document.getElementById("wdgt_wrapper_chat");

          for (var id in groupArrays) {
            $(document).ready(function () {
              $(".far.fa-clock")
                .removeClass("far fa-clock")
                .addClass("far fa-check-double");
            });

            if (id > 0) {
              var bubbleChatDaySeparator = document.createElement("li");
              bubbleChatDaySeparator.setAttribute("class", "title-day");
              bubbleChatDaySeparator.style.fontSize = "12px";
              bubbleChatDaySeparator.style.marginBottom = "1rem";
              bubbleChatDaySeparator.style.fontWeight = "bold";
              bubbleChatDaySeparator.style.color = "#b9bcc6";
              bubbleChatDaySeparator.style.textAlign = "center";
              bubbleChatDaySeparator.innerHTML = groupArrays[id].date;
              wrpChat.appendChild(bubbleChatDaySeparator);
            } else {
              var bubbleChat = document.getElementsByClassName("title-day");
              bubbleChat[0].style.fontSize = "12px";
              bubbleChat[0].style.marginBottom = "1rem";
              bubbleChat[0].style.color = "#b9bcc6";
              bubbleChat[0].style.textAlign = "center";
              bubbleChat[0].innerHTML = groupArrays[id].date;
            }

            for (var chat in groupArrays[id].messages) {
              var chating = groupArrays[id].messages[chat];
              if (chating.from_type == 1) {
                if (chating.text !== "Hai..")
                  self.generateCustomerMessage(
                    wrpChat,
                    chating,
                    chating.payload
                  );
              } else {
                self.generateBotMessage(wrpChat, chating, chating.payload);
              }
            }
          }
        }
      }, tokenCode);
    });

    // this.socket.on("room.waiting", function (msg) {
    //   console.log("room waiting", msg)
    // })

    // this.socket.on("room.assigned", function (msg) {
    //   console.log("room assigned", msg);
    // });

    this.socket.on("chat.status", function (msg) {
      if (msg.data.status > 0) {
        $(".far.fa-clock")
          .filter('[idd="status-' + msg.data.message_id + '"]')
          .removeClass("far fa-clock")
          .addClass("far fa-check-double");
      } else if (msg.data.status < 0) {
        $(".far.fa-clock")
          .filter('[idd="status-' + msg.data.message_id + '"]')
          .removeClass("far fa-clock")
          .addClass("far fa-times");
      }
    })

    this.socket.on("chat", function (msg) {
      // console.log("message", JSON.stringify(msg))

      var now = new Date();
      now.setHours(now.getHours() + 7);

      var messageStruct = {
        from_type: msg.message.from_type,
        text: msg.message.text,
        chat_id: msg.customer.username,
        date: moment().format(),
      };
      // console.log('messageStruct', messageStruct)

      // always overwrite session id
      if (msg.session.id !== undefined) {
        self.sessionId = msg.session.id;
      }

      if (msg.agent.name !== undefined) {
        self.agentName = msg.agent.name;
      }

      if (msg.payload !== undefined) {
        messageStruct.payload = msg.payload;
      }

      if (messageStruct.from_type !== "1") {
        self.generateBotMessage(
          self.wrapperChat,
          msg.message,
          msg.message.payload
        );
      }

      var chtBox = document.getElementById("wdgt_chatbox");

      var statusDelivered = {
        data: {
          message_id: msg.message_id,
          room_id: msg.session.room_id,
          session_id: msg.session.id,
          status: 1,
          times: Math.floor(new Date().getTime() / 1000),
          timestamp: new Date(),
        },
      };
      setTimeout(() => {
        socket.emit("chat.status", statusDelivered);

        self.getConversation(function (success, respData) {
          var conversations = respData.data.conversations.map((item) => ({
            data: {
              message_id: msg.message_id,
              room_id: msg.session.room_id,
              session_id: msg.session.id,
              status: 3,
              times: Math.floor(new Date().getTime() / 1000),
              timestamp: new Date(),
            },
          }));

          var statusRead = [
            {
              data: {
                message_id: msg.message_id,
                room_id: msg.session.room_id,
                session_id: msg.session.id,
                status: 3,
                times: Math.floor(new Date().getTime() / 1000),
                timestamp: new Date(),
              },
            },
          ];

          var statusReadSingle = {
            data: {
              message_id: msg.message_id,
              room_id: msg.session.room_id,
              session_id: msg.session.id,
              status: 3,
              times: Math.floor(new Date().getTime() / 1000),
              timestamp: new Date(),
            },
          };

          var newdata = [...conversations, ...statusRead];
          if (chtBox.style.display === "block") {
            socket.emit("chat.status", statusReadSingle);
          } else {
            socket.emit("chat.status", statusDelivered);
            localStorage.setItem("statusRead", JSON.stringify(newdata));
            self.onclickButton();
          }
        });
      }, 1000);
    });

    this.socket.on("room.handover", function (msg) {
      var username = self.username;
      var email = self.usermail;
      var konnekWidget = JSON.parse(localStorage.getItem("konnekWidget"))
        ? JSON.parse(localStorage.getItem("konnekWidget"))
        : {};
      var getKonnektime = konnekWidget.usertimeused
        ? konnekWidget.usertimeused
        : null;
      var getKonneksocketusername = konnekWidget.username
        ? konnekWidget.username
        : null;
      var getKonneksocketemail = konnekWidget.useremail
        ? konnekWidget.useremail
        : null;

      var newDate = new Date();
      var validate = false;
      self.csatText = false;

      if (username.value !== "" && email.value !== "") {
        validate = true;
      } else if (
        getKonneksocketusername !== null &&
        getKonneksocketusername !== undefined &&
        getKonneksocketemail !== null &&
        getKonneksocketemail !== undefined &&
        new Date(getKonnektime) > newDate
      ) {
        validate = true;
        self.usermail = getKonneksocketemail;
        self.username = getKonneksocketusername;
      }

      if (validate == true) {
        if (self.addInfo) {
          var addInfo = [];
          self.addInfo.forEach((entry) => {
            var infoname = document.getElementsByName(entry.name)[0];
            if (entry.type !== null)
              addInfo.push({ title: entry.label, description: infoname.value });
          });
          var body = {
            username: self.usermail,
            name: self.username,
            addInfo: addInfo,
          };
        } else {
          var body = {
            username: self.usermail,
            name: self.username,
          };
        }
      }
    });

    this.socket.on("room.closed", function (msg) {
      // console.log("closed", msg);
      var konnekWidget = JSON.parse(localStorage.getItem("konnekWidget"));
      konnekWidget.flag = 1;
      localStorage.setItem("konnekWidget", JSON.stringify(konnekWidget));

      self.openWidget();
    });
    this.socket.on("csat", function (msg) {
      // console.log("csat", msg);
      self.csatText = true;
      self.openWidget();
      var wrpInputFormMessage = document.getElementById(
        "wrapper-input-message"
      );
      wrpInputFormMessage.style.display = "block";
      var now = new Date();
      now.setHours(now.getHours() + 7);
      var messageStruct = {
        from_type: msg.message.from_type,
        text: msg.message.payload,
        chat_id: msg.customer.username,
        date: moment().format(),
      };

      self.generateBotMessage(
        self.wrapperChat,
        msg.message,
        msg.message.payload
      );
    });

    this.socket.on("csat.close", function (msg) {
      // console.log("csatclose", msg);
      self.csatText = false;
      var wrpInputFormMessage = document.getElementById(
        "wrapper-input-message"
      );
      wrpInputFormMessage.style.display = "none";
      var wrpInputFormMessage =
        document.getElementsByClassName("wdgt-col-md-3")[0];
      wrpInputFormMessage.style.display = "block";
    });
  }

  openWidget(refresh = false) {
    var wrpInputFormStart = document.getElementById("wdgt_form_start");
    wrpInputFormStart.style.display = "block";
    var wrpInputFormMessage = document.getElementById("wrapper-input-message");
    wrpInputFormMessage.style.display = "none";
    var self = this;
    var wrpChat = document.getElementById("wdgt_wrapper_chat");
    this.wrapperChat = wrpChat;

    $(document).ready(function () {
      $("#wdgt_form_start")
        .unbind()
        .click(function () {
          var konnekWidget = JSON.parse(localStorage.getItem("konnekWidget"))
            ? JSON.parse(localStorage.getItem("konnekWidget"))
            : {};
          self.csatText = false;
          var wrpInputFormStart = document.getElementById("wdgt_form_start");
          wrpInputFormStart.style.display = "none";
          var wrpInputFormMessage = document.getElementById(
            "wrapper-input-message"
          );
          wrpInputFormMessage.style.display = "block";

          konnekWidget.flag = 0;
          localStorage.setItem("konnekWidget", JSON.stringify(konnekWidget));
        });
    });
  }

  //start tambahan++
  withTimeout(onSuccess, onTimeout, timeout) {
    let called = false;
    const timer = setTimeout(() => {
      if (called) return;
      called = true;
      onTimeout();
    }, timeout);

    return (...args) => {
      if (called) return;
      called = true;
      clearTimeout(timer);
      onSuccess.apply(this, args);
    };
  }

  onclickButton() {
    var self = this;
    var buttonChat = document.getElementById("wdgt_chat_icon");
    buttonChat.addEventListener("click", function (e) {
      // is chatbox  already open

      var chtBox = document.getElementById("wdgt_chatbox");
      var thisButton = document.getElementById("wdgt_chat_icon");
      if (chtBox.style.display === "block") {
        var statusRead = JSON.parse(localStorage.getItem("statusRead"))
          ? JSON.parse(localStorage.getItem("statusRead"))
          : {};
        for (var i = 0; i < statusRead.length; i++) {
          self.socket.emit("chat.status", statusRead[i]);
        }
      }
    });
  }

  // end tambahan++

  sendMessage(msg) {
    var self = this;
    var konnekWidget = JSON.parse(localStorage.getItem("konnekWidget"));

    // console.log("msg : " + msg);

    if (msg) {
      var emitObject = {
        message_id: this.generateUUID(),
        reply_id: null,
        ttl: 5,
        text: msg,
        time: new Date(
          new Date().toLocaleString("en-US", { timeZone: "Asia/Jakarta" })
        ),
        type: "text",
        room_id: self.roomId,
        session_id: self.sessionId,
        channel_code: "web",
        reply_token: "",
      };

      // console.log("emitObject : " + JSON.stringify(emitObject));

      var now = new Date();
      now.setHours(now.getHours() + 7);

      var messageStruct = {
        msg_id: emitObject.message_id,
        from_type: 1,
        text: emitObject.text,
        chat_id: self.usermail,
        date: moment().format(),
      };
      self.generateCustomerMessage(self.wrapperChat, messageStruct);
      $(".far.fa-clock").attr("idd", "status-" + messageStruct.msg_id);

      if (this.socket === null) {
        self.handleSocket(self.onclickButton());
      }

      setTimeout(() => {
        this.socket.emit(
          "chat",
          emitObject,
          self.withTimeout(
            (response) => {
              // console.log("emitObject", emitObject);
              // console.log("response", response);
              if (response.status === 0) {
                if (self.addInfo) {
                  var addInfo = [];
                  self.addInfo.forEach((entry) => {
                    var infoname = document.getElementsByName(entry.name)[0];
                    if (entry.type !== null)
                      addInfo.push({
                        title: entry.label,
                        description: infoname.value,
                      });
                  });
                  var body = {
                    name: self.username,
                    username: self.usermail,
                    text: msg,
                    addInfo: addInfo,
                  };
                } else {
                  var body = {
                    name: self.username,
                    username: self.usermail,
                    text: msg,
                  };
                  // console.log("body", body);
                }

                // self.requestHTTPAsync( {
                //     method: 'POST',
                //     body: body,
                //     url: `${self.baseURL}/webhook/widget/${self.clientId}` // fill this with url get channel config by company_id
                // }, (status, resp)=> {
                //     if (status==200) {
                //         $(".far.fa-clock").filter('[idd="status-' + messageStruct.msg_id + '"]').removeClass("far fa-clock").addClass("far fa-check-double");

                //         resp = (JSON.parse(resp)).data
                //         // console.log('resp2 ', resp)
                //         var decodedToken = self.parseJwt(resp.token)
                //         // console.log('decodedToken: ', decodedToken)
                //         self.roomId = decodedToken.data.room_id
                //         self.userId = decodedToken.user_id
                //         self.sessionId = decodedToken.data.session_id
                //         self.socketToken = resp.token
                //         self.handleSocket(
                //             setTimeout(function() {
                //         }, 1000))
                //         sbmitForm.textContent = self.isLoading ? 'Loading ...' : 'Start Chat'
                //         sbmitForm.style.disabled = self.isLoading
                //         // Open the chat history

                //         var futureDate = new Date(new Date().getTime() + 15 * 60000);
                //         var konnekToken = JSON.stringify({ "username": username.value, "useremail": email.value, "usertimeused": futureDate, "flag": 0, 'token': resp.token });

                //         localStorage.setItem("konnekWidget", konnekToken)

                //     }
                // })
              } else {
                $(".far.fa-clock")
                  .filter('[idd="status-' + messageStruct.msg_id + '"]')
                  .removeClass("far fa-clock")
                  .addClass("far fa-check-double");
              }
            },
            () => {
              $(".far.fa-clock")
                .filter('[idd="status-' + messageStruct.msg_id + '"]')
                .removeClass("far fa-clock")
                .addClass("far fa-times");
            },
            emitObject.ttl * 1000
          )
        );
      }, 300);

      

      localStorage.setItem("konnekWidget", JSON.stringify(konnekWidget));
    }
  }

  requestHTTPAsync(options, callback, token = "") {
    var http = new XMLHttpRequest();

    http.onreadystatechange = () => {
      if (http.readyState == 4) {
        callback(http.status, http.responseText);
      }
    };
    http.open(options.method, options.url, true);

    if (token != "") {
      http.setRequestHeader("Authorization", "Bearer " + token);
    }

    if (options.body instanceof FormData) {
      http.send(options.body);
    } else {
      http.setRequestHeader("Content-Type", "application/json");
      http.send(JSON.stringify(options.body));
    }
  }

  parseJwt(token) {
    var base64Url = token.split(".")[1];
    var base64 = base64Url.replace(/-/g, "+").replace(/_/g, "/");
    var jsonPayload = decodeURIComponent(
      atob(base64)
        .split("")
        .map(function (c) {
          return "%" + ("00" + c.charCodeAt(0).toString(16)).slice(-2);
        })
        .join("")
    );
    return JSON.parse(jsonPayload);
  }
}
