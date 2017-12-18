// event polyfil
if ( ! ("path" in Event.prototype)) {
    Object.defineProperty(Event.prototype, "path", {
        get: function() {
            var path = [];
            var currentElem = this.target;
            while (currentElem) {
                path.push(currentElem);
                currentElem = currentElem.parentElement;
            }
            if (path.indexOf(window) === -1 && path.indexOf(document) === -1)
                path.push(document);
            if (path.indexOf(window) === -1)
                path.push(window);
            return path;
        }
    });
}   

var app = {

    supports: {
        WEB_COMPONENT: (
            'registerElement' in document && 
            'import' in document.createElement('link') && 
            'content' in document.createElement('template')
        )
    },

    run: function() {
        window.Polymer = window.Polymer || {};
        window.Polymer.dom = 'shadow';

        prepare().then(() => {
            load();
        });

        function defer() {
            let promise, resolve, reject;
            promise = new Promise((res, rej) => {
                resolve = res;
                reject = rej;
            });
            return { promise: promise, resolve: resolve, reject: reject };
        }

        function prepare() {
            let d = defer();

            if (app.supports.WEB_COMPONENT) {
                d.resolve();
            } else {
                
                window.Polymer = window.Polymer || {};
                window.Polymer.dom = 'shady';

                // window.ShadyDOM = { force: true };
                // window.ShadyCSS = { shimcssproperties: true };

                var script = document.createElement('script');
                // script.async = true;
                script.src = 'bower_components/webcomponentsjs/webcomponents-lite.js';
                script.addEventListener('load', () => {
                    d.resolve();
                });

                document.head.appendChild(script);
            }
            return d.promise;
        }

        function load() {
            let deps = [
                'src/themes/theme-default/theme-default.html',
                'src/elements/kct-app/kct-app.html'
            ].map((href) => {
                let d = defer();
                let link;
                
                link = document.head.querySelector('link[href="' + href + '"][import-href]');

                if ( ! link) {
                    link = document.createElement('link');
                    link.rel = 'import';
                    link.href = href;
                    link.async = true;
                    link.setAttribute('import-href', '');
                }

                link.addEventListener('load', () => {
                    d.resolve(href);
                });

                if (link.parentNode == null) {
                    document.head.appendChild(link);    
                }
                
                return d.promise;
            });

            

            Promise.all(deps).then(() => {
                let t = setTimeout(() => {
                    clearTimeout(t);
                    finish();    
                }, 1000);
            });
        }

        function finish() {
            var indicator;

            document.body.classList.remove('loading');
            document.body.classList.add('ready');

            indicator = document.querySelector('#loading-indicator');
            indicator.parentNode.removeChild(indicator);
            
            // register service worker
            if ('serviceWorker' in navigator) {
                // navigator.serviceWorker.register('service-worker.js');
            }
        }

    }

};

app.run();

