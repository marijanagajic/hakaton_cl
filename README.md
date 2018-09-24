# hakaton_cl
Web aplikacija realizovana koristeći CRUD funkcionalnosti.

START: lein ring server

Login - username: user12
        password: pass

Skripta MySQL baze se nalazi u folderu "baza".

Aplikacija je razvijena u Clojure programskom jeziku koristeći Leiningen, biblioteke za web aplikacije kao što su: Ring, Compojure, SQL jdbc za povezivanje sa MySQL bazom podataka i Mustache za izradu stranica.

Aplikacija omogućava pregled u vidu tabele svih prijavljenih timova za takmičenje na hakatonu. 
Za svaki prijavljeni tim može se izabrati opcija Obriši i time se taj tim briše iz baze podataka. Izborom opcije Izmeni/Detaljnije mogu se izmeniti svi uneti podaci o timu.
Grad takmičenja se bira iz padajuće liste.
Na stranici za izmenu tima prikazana je i tabela sa svim članovima tog prijavljenog tima. Moguće je izaбrati i opciju za dodavanje novog člana čime se otvara nova stranica za unos podataka o članu. U tabeli moguće je za svakog člana izabrati opciju izmeni i na taj način moguće je izmeniti svakog člana posebno. Takođe, moguće je svakom članu tima dodati projekat na kome je radio kao dokaz radnog iskustva. Izborom opsije Dodaj projekat otvara se stranica za unos podataka o novom projektu i sa desne strane vidljiva je tabela već unetih projekata. Svaki projekat moguće je izbrisati.

U svakom trenutku može se izabrati opcija Dodaj novi tim. Kada se otvori nova stranica za unos i popune sva polja klikom na dugme Sačuvaj novi tim je unet u bazu.
