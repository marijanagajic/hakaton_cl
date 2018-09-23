(ns prijava.model.timovi
  (:refer-clojure :exclude [get])
  (:require [clojure.java.jdbc :as jdbc]
            [clojure.java.jdbc.sql :as sql]
            )
  )

(def mysql-db {
               :subprotocol "mysql"
               :subname "//localhost:3306/hakaton"
               :user "root"
               :password ""
               :zeroDateTimeBehaviour "convertToNull"
               })

(def now (str (java.sql.Timestamp. (System/currentTimeMillis))))

(defn sviTimoviJoinGradovi []
  (jdbc/query mysql-db
              ["SELECT * FROM timovi t INNER JOIN gradovi g ON (t.idgrad = g.idgrad)"]))

(defn sviTimovi []
  (jdbc/query mysql-db
              ["SELECT * FROM timovi t"]))

(defn sviGradovi []
  (jdbc/query mysql-db
              ["SELECT * FROM gradovi g"]))

(defn get [id]
  (first (jdbc/query mysql-db
                  (sql/select * :timovi (sql/where {:idtim id})))))

(defn sviClanoviTima [id]
  (jdbc/query mysql-db
                     (sql/select * :clanovi (sql/where {:idtim id}))))

(defn sviProjektiClana [id]
  (jdbc/query mysql-db
              (sql/select * :projekti (sql/where {:idclan id}))))

(defn obrisiTim [id]
  (jdbc/delete! mysql-db :timovi (sql/where {:idtim id})))


(defn update [id params]
  (jdbc/update! mysql-db :timovi params (sql/where {:idtim id})))

(defn insertTim [params]
  (jdbc/insert! mysql-db :timovi params))

(defn insertClan [params]
  (jdbc/insert! mysql-db :clanovi params))

(defn insertProjekat [params]
  (jdbc/insert! mysql-db :projekti params))