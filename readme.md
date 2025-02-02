This repository contains a Home Assistant addon that runs [Open WebUI](https://github.com/open-webui/open-webui/tree/main) on your Home Assistant's machine.
 >**Open WebUI is an [extensible](https://docs.openwebui.com/features/plugin/), feature-rich, and user-friendly self-hosted AI platform designed to operate entirely offline.** It supports various LLM runners like **Ollama** and **OpenAI-compatible APIs**, with **built-in inference engine** for RAG, aking it a **powerful AI deployment solution**.
> 
> ![Open WebUI Demo](https://raw.githubusercontent.com/open-webui/open-webui/main/demo.gif)

## Installation

1. Go to your [Home Assistant's Addon Store](https://my.home-assistant.io/redirect/supervisor_store/)
2. Click the three dots in the upper right and add the custom repository: `https://github.com/mikastamm/open-webui-homeassistant-addon` 
3. Install the **OpenWebUI** add-on from the add-on store.  
4. Start the add-on.

## Accessing OpenWebUI

After installing and starting the **OpenWebUI** add-on, you can access it through your Home Assistant URL. By default, it runs on port **8080**. For example: http://homeassistant.local:8080


 >
> ## Key Features of Open WebUI ⭐
> 
> - 🚀 **Effortless Setup**: Install seamlessly using Docker or Kubernetes (kubectl, kustomize or helm) for a hassle-free experience with support for both `:ollama` and `:cuda` tagged images.
> 
> - 🤝 **Ollama/OpenAI API Integration**: Effortlessly integrate OpenAI-compatible APIs for versatile conversations alongside Ollama models. Customize the OpenAI API URL to link with **LMStudio, GroqCloud, Mistral, OpenRouter, and more**.
> 
> - 🛡️ **Granular Permissions and User Groups**: By allowing administrators to create detailed user roles and permissions, we ensure a secure user environment. This granularity not only enhances security but also allows for customized user experiences, fostering a sense of ownership and responsibility mongst users.
> 
> - 📱 **Responsive Design**: Enjoy a seamless experience across Desktop PC, Laptop, and Mobile devices.
> 
> - 📱 **Progressive Web App (PWA) for Mobile**: Enjoy a native app-like experience on your mobile device with our PWA, providing offline access on localhost and a seamless user interface.
> 
> - ✒️🔢 **Full Markdown and LaTeX Support**: Elevate your LLM experience with comprehensive Markdown and LaTeX capabilities for enriched interaction.
> 
> - 🎤📹 **Hands-Free Voice/Video Call**: Experience seamless communication with integrated hands-free voice and video call features, allowing for a more dynamic and interactive chat environment.
> 
> - 🛠️ **Model Builder**: Easily create Ollama models via the Web UI. Create and add custom characters/agents, customize chat elements, and import models effortlessly through [Open WebUI Community](https://openwebui.com/) integration.
> 
> - 🐍 **Native Python Function Calling Tool**: Enhance your LLMs with built-in code editor support in the tools workspace. Bring Your Own Function (BYOF) by simply adding your pure Python functions, enabling seamless integration with LLMs.
> 
> - 📚 **Local RAG Integration**: Dive into the future of chat interactions with groundbreaking Retrieval Augmented Generation (RAG) support. This feature seamlessly integrates document interactions into your chat experience. You can load documents directly into the chat or add files to your document ibrary, effortlessly accessing them using the `#` command before a query.
> 
> - 🔍 **Web Search for RAG**: Perform web searches using providers like `SearXNG`, `Google PSE`, `Brave Search`, `serpstack`, `serper`, `Serply`, `DuckDuckGo`, `TavilySearch`, `SearchApi` and `Bing` and inject the results directly into your chat experience.
> 
> - 🌐 **Web Browsing Capability**: Seamlessly integrate websites into your chat experience using the `#` command followed by a URL. This feature allows you to incorporate web content directly into your conversations, enhancing the richness and depth of your interactions.
> 
> - 🎨 **Image Generation Integration**: Seamlessly incorporate image generation capabilities using options such as AUTOMATIC1111 API or ComfyUI (local), and OpenAI's DALL-E (external), enriching your chat experience with dynamic visual content.
> 
> - ⚙️ **Many Models Conversations**: Effortlessly engage with various models simultaneously, harnessing their unique strengths for optimal responses. Enhance your experience by leveraging a diverse set of models in parallel.
> 
> - 🔐 **Role-Based Access Control (RBAC)**: Ensure secure access with restricted permissions; only authorized individuals can access your Ollama, and exclusive model creation/pulling rights are reserved for administrators.
> 
> - 🌐🌍 **Multilingual Support**: Experience Open WebUI in your preferred language with our internationalization (i18n) support. Join us in expanding our supported languages! We're actively seeking contributors!
> 
> - 🧩 **Pipelines, Open WebUI Plugin Support**: Seamlessly integrate custom logic and Python libraries into Open WebUI using [Pipelines Plugin Framework](https://github.com/open-webui/pipelines). Launch your Pipelines instance, set the OpenAI URL to the Pipelines URL, and explore endless possibilities. Examples](https://github.com/> open-webui/pipelines/tree/main/examples) include **Function Calling**, User **Rate Limiting** to control access, **Usage Monitoring** with tools like Langfuse, **Live Translation with LibreTranslate** for multilingual support, **Toxic Message Filtering** and much more.
> 
> - 🌟 **Continuous Updates**: We are committed to improving Open WebUI with regular updates, fixes, and new features.
> 
> Want to learn more about Open WebUI's features? Check out our [Open WebUI documentation](https://docs.openwebui.com/features) for a comprehensive overview!


# Configuring this Addon

This addon is functional directly after installing and starting by visiting your homeassistant installation on port 8080. For some features, additional configuration is needed.

## Microphone Access

Most web browsers block microphone access on non-secure (HTTP) sites. This means that if your Home Assistant URL isn’t using HTTPS, the speech-to-text features won’t work. To enable these features, you’ll need to secure your connection. One way to do this is by hosting OpenWebUI on a subdomain and configuring SSL through the NGINX Homeassistant Addon (see the next section).

## Internet Access

If you want to access your Open WebUI instance from outside your Home Assistants local network, you will want to configure SSL. This is best done by giving Open WebUI it's own subdomain on your Home Assistan's domain.

---

## Example Setup: Hosting OpenWebUI on a Subdomain with SSL

Hosting OpenWebUI on a subdomain allows you to secure your connection with HTTPS. In this example, we use the NGINX add-on together with the Let's Encrypt Home Assistant add-on.

> **Warning:** This configuration makes OpenWebUI publicly accessible. Use it at your own risk and be sure to set a strong password.

### Prerequisites

- **Local Access:** Verify that you can reach OpenWebUI on your local Home Assistant domain (e.g., `http://homeassistant.local:8080`).

---

### DNS Configuration

If your Home Assistant instance is reachable at `myhome.com` and you want to serve OpenWebUI from `chat.myhome.com`, add a CNAME DNS record for your subdomain.

**Example DNS Record:**

- **CNAME:** `chat.myhome.com` → `myhome.com`

---

### Set Up SSL for the Subdomain

This guide assumes you already have SSL enabled for your Home Assistant domain via the Let's Encrypt add-on. To secure your subdomain:

1. **Add the Subdomain:**  
   Open your Let's Encrypt settings and include your subdomain (e.g., `chat.myhome.com`) in the domains field.

2. **Run Let's Encrypt:**  
   Start the Let's Encrypt add-on and verify that the process completes successfully.

3. **Confirm Files:**  
   If successful, you should see the following files on your system:
   - `/ssl/fullchain.pem`
   - `/ssl/privkey.pem`
   *Note: This setup was tested using the HTTP validation method.*

---

### Configure NGINX for the Subdomain

Now, configure the NGINX Home Assistant add-on so that requests to your subdomain are forwarded to OpenWebUI.

1. **Enable Custom Configuration:**
    In the NGINX add-on settings, enable the **Customize** option by setting `active` to `true`.
    The `server` property (indicating where NGINX will look for configuration files) can usually remain at its default value.


2. **Create a Subdomain Configuration File:**
   On your Home Assistant system, create a directory named `nginx_proxy` if it doesn’t already exist.
   Create a file at the following location:
    ```
    /share/nginx_proxy/chat.myhome.com.conf
    ```

3. **Add the Following Configuration:**
```
# Redirect HTTP to HTTPS
server {
    listen 80;
    server_name chat.myhome.com;
    return 301 https://$host$request_uri;
}
server {
    listen 443 ssl;
    server_name chat.myhome.com;
    ssl_certificate /ssl/fullchain.pem;
    ssl_certificate_key /ssl/privkey.pem;
    
    # Optional security headers
    add_header X-Content-Type-Options nosniff;
    add_header X-Frame-Options "SAMEORIGIN";
    add_header Referrer-Policy "no-referrer-when-downgrade";
    location / {
        # Forward requests to your OpenWebUI instance
        proxy_pass http://homeassistant.local:8080;
        proxy_set_header Host $host;
        proxy_set_header X-Real-IP $remote_addr;
        proxy_set_header X-Forwarded-For $proxy_add_x_forwarded_for;
        proxy_set_header X-Forwarded-Proto $scheme;
        
        # Enable WebSocket support
        proxy_http_version 1.1;
        proxy_set_header Upgrade $http_upgrade;
        proxy_set_header Connection "upgrade";
    }
}
```

   **Tip:** If your local OpenWebUI address differs from `http://homeassistant.local:8080`, update the `proxy_pass` URL accordingly.

---

Once this configuration is in place, you can access OpenWebUI securely via your subdomain:

https://chat.myhome.com

