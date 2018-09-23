(ns prijava.core
  (:use compojure.core)
  (:require [compojure.handler :as handler]
            [compojure.route :as route]
            [ring.middleware.basic-authentication :refer :all]
            [ring.util.response :as resp]
            [prijava.controller.controller :as controller]
            [prijava.model.timovi :as timovi-model]
            )
  )

(defroutes public-routes
           (GET "/" [] (controller/index))
           (route/resources "/")
           (GET "/index" [] (controller/index))
           (route/resources "/")
           (GET "/timovi" [] (controller/timovi))
           (route/resources "/")
           (GET "/login" [] (controller/login))
           (route/resources "/")


           (GET "/model/timovi/:id/clanovi" [id] (controller/clanoviTima id))

           (GET "/model/timovi/:id/remove" [id]
             (do (timovi-model/obrisiTim id)
                 (resp/redirect "/timovi")))

           (GET "/model/timovi/:id/update" [id] (controller/izmenitiTim id))

           (POST "/model/timovi/:idtim/update" [& params]
             (do (timovi-model/update (:idtim params) params)
                 (resp/redirect "/timovi")))

           (GET "/model/timovi/dodajTim" [] (controller/dodatiTim))

           (POST "/model/timovi/dodajTim" [& params]
             (do (timovi-model/insertTim params)
                 (resp/redirect "/timovi")))

           (GET "/model/timovi/:id/dodajClana" [id] (controller/dodatiClana id))

           (POST "/model/timovi/:idtim/dodajClana" [& params]
             (do (timovi-model/insertClan params)
                 (resp/redirect "/timovi")))

           (GET "/model/timovi/:id/dodajProjekat" [id] (controller/dodatiProjekat id))

           (POST "/model/timovi/:idclan/dodajProjekat" [& params]
             (do (timovi-model/insertProjekat params)
                 (resp/redirect "/timovi")))

           )








(defroutes app-routes
  public-routes
           (route/not-found "404 Page Not Found")
           )
(def app
  (handler/site app-routes)
  )
