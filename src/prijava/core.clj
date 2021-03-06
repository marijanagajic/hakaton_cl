(ns prijava.core
  (:use compojure.core
        )
  (:require [compojure.handler :as handler]
            [compojure.route :as route]
            [ring.middleware.basic-authentication :refer :all]
            [ring.util.response :as resp]
            [prijava.controller.controller :as controller]
            [prijava.model.timovi :as timovi-model]
            )
  (:gen-class))



(defroutes public-routes
           (GET "/" [] (controller/login))
           (route/resources "/")

           (GET "/timovi" [] (controller/timovi))
           (route/resources "/")

           (GET "/login" [] (controller/login))
           (route/resources "/")

           (GET "/uspesno" [] (controller/uspesno))
           (route/resources "/")

           (POST "/login" [username password]
             (do (timovi-model/do-login username password)
                 ))

           (GET "/model/timovi/:id/clanovi" [id] (controller/clanoviTima id))

           (GET "/model/timovi/:id/remove" [id]
             (do (timovi-model/obrisiTim id)
                 (resp/redirect "/timovi")))

           (GET "/model/timovi/:id/removeProjekat" [id]
             (do (timovi-model/obrisiProjekat id)
                 (resp/redirect "/uspesno")))

           (GET "/model/timovi/:id/update" [id] (controller/izmenitiTim id))

           (POST "/model/timovi/:idtim/update" [& params]
             (do (timovi-model/update (:idtim params) params)
                 (resp/redirect "/timovi")))

           (GET "/model/timovi/:id/updateClan" [id] (controller/izmenitiClana id))

           (POST "/model/timovi/:idclan/updateClan" [& params]
             (do (timovi-model/updateClan (:idclan params) params)
                 (resp/redirect "/uspesno")))

           (GET "/model/timovi/dodajTim" [] (controller/dodatiTim))

           (POST "/model/timovi/dodajTim" [& params]
             (do (timovi-model/insertTim params)
                 (resp/redirect "/timovi")))

           (GET "/model/timovi/:id/dodajClana" [id] (controller/dodatiClana id))

           (POST "/model/timovi/:idtim/dodajClana" [& params]
             (do (timovi-model/insertClan params)
                 (resp/redirect "/uspesno")))

           (GET "/model/timovi/:id/dodajProjekat" [id] (controller/dodatiProjekat id))

           (POST "/model/timovi/:idclan/dodajProjekat" [& params]
             (do (timovi-model/insertProjekat params)
                 (resp/redirect "/uspesno")))

           )


(defroutes app-routes
           public-routes
           (route/not-found "404 Page Not Found"))
(def app
  (handler/site app-routes)
  )
