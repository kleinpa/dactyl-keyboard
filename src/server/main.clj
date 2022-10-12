(ns server.main
  (:refer-clojure :exclude [use import])
  (:require [server.handler :refer [app]])
  (:require [ring.adapter.jetty :refer [run-jetty]])
  (:gen-class))

(defn -main [& args]
  (run-jetty app {:port (Integer/valueOf (or (System/getenv "port") "3000"))}))
