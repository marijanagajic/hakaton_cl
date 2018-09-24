(ns prijava.controller.controller
  (:require
    [clostache.parser :as clostache]
    [prijava.model.timovi :as timovi-model]
    [ring.util.response :as resp]
    ))

(defn read-template [template-name]
  (slurp (clojure.java.io/resource
           (str "views/" template-name ".mustache"))))

(defn render-template [template-file params]
  (clostache/render (read-template template-file) params))


(defn login []
  (render-template "login-page" {}))

(defn uspesno []
  (render-template "success" {}))

(defn timovi []
  (render-template "timovi" {:timovi (timovi-model/sviTimoviJoinGradovi)
                             :gradovi (timovi-model/sviGradovi)
                             }))

(defn izmenitiTim [id]
  (render-template "izmenaTim" {:timovi (timovi-model/get id)
                                     :gradovi (timovi-model/sviGradovi)
                                        :clanovi (timovi-model/sviClanoviTima id)
                                     }))

(defn izmenitiClana [id]
  (render-template "izmenaClan" {:clanovi  (timovi-model/getClan id)
                                }))

(defn clanoviTima [id]
  (render-template "clanovi" {:clanovi (timovi-model/sviClanoviTima id)
                              }))

(defn dodatiTim []
  (render-template "noviTim" {:gradovi (timovi-model/sviGradovi)
                                     }))
(defn dodatiClana [id]
  (render-template "noviClanTima" {:idtim id}
                   ))

(defn dodatiProjekat [id]
  (render-template "noviProjekat" {:idclan id
                                      :projekti (timovi-model/sviProjektiClana id)}
                   ))
