# System manager

To repozytorium zawiera konfiguracje systemu. Używam nix oraz home-manager'a do zarządzania konfiguracją systemu oraz użytkownika.

## Ogólne

- W Makefile znajdują się przydatne skrypty do interakcji z konfiguracją.

- Nie używaj `cd` przed wywołaniem poleceń, jesteś w katalogu głównym repozytorium. Używaj `cd` tylko wtedy, gdy wejście do danego katalogu jest wymagane.

- Dokumentację oraz przykładowe użycie wszelkich pakietów, programów, bibliotek i narzędzi oraz ich opcji musisz sprawdzać za pomocą mcp context7.

## Nix

- Konfiguracja znajduje się w katalogu nix-configuration.

- Repozytorium korzysta z nowoczesnego podejścia do nix, wykorzystując flakes oraz dzieli konfigurację na moduły.

- Korzysta z home-manager'a do zarządzania konfiguracją użytkownika.

- Musisz używać mcp nixos do interakcji z konfiguracją nix oraz home-manager'a, szukania opcji konfiguracyjnych itd.
