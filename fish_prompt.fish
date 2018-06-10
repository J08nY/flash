set -g CMD_DURATION 0

function flash_fst; set_color -o fa0; end
function flash_snd; set_color -o C00; end
function flash_trd; set_color -o 666; end
function flash_dim; set_color -o 555; end
function flash_off; set_color normal; end
function bc; command bc -l $argv; end

function fish_prompt
  set -l code $status

  set -l prompt (prompt_pwd)
  set -l base (basename "$prompt")

  printf (begin
    if test "$USER" = "root"
      echo (flash_fst)"#root"
    else
      echo (flash_snd)"@$USER"
    end
  end)" "(flash_snd)"( "(begin
    if test "$PWD" = "/"
      test $code -eq 0; and echo (flash_fst)"/"(flash_off); or echo (flash_dim)"/"(flash_off)
    else
      echo ""
    end
  end)(echo "$prompt" \
  | sed "s|~/arch|"(begin
      echo -n "~/"(flash_fst)
      printf \uf187
      echo -n (flash_off)
    end)"|; s|~/aud|"(begin
      echo -n "~/"(flash_fst)
      printf \uf001
      echo -n (flash_off)
    end)"|; s|~/bin|"(begin
      echo -n "~/"(flash_fst)
      printf \uf120
      echo -n (flash_off)
    end)"|; s|~/cloud|"(begin
      echo -n "~/"(flash_fst)
      printf \uf0c2
      echo -n (flash_off)
    end)"|; s|~/dev|"(begin
      echo -n "~/"(flash_fst)
      printf \uf121
      echo -n (flash_off)
    end)"|; s|~/doc|"(begin
      echo -n "~/"(flash_fst)
      printf \uf15c
      echo -n (flash_off)
    end)"|; s|~/down|"(begin
      echo -n "~/"(flash_fst)
      printf \uf019
      echo -n (flash_off)
    end)"|; s|~/edu|"(begin
      echo -n "~/"(flash_fst)
      printf \uf19d
      echo -n (flash_off)
    end)"|; s|~/img|"(begin
      echo -n "~/"(flash_fst)
      printf \uf03e
      echo -n (flash_off)
    end)"|; s|~/proj|"(begin
      echo -n "~/"(flash_fst)
      printf \uf247
      echo -n (flash_off)
    end)"|; s|~/pub|"(begin
      echo -n "~/"(flash_fst)
      printf \uf15b
      echo -n (flash_off)
    end)"|; s|~/vid|"(begin
      echo -n "~/"(flash_fst)
      printf \uf03d
      echo -n (flash_off)
    end)"|" \
  | sed "s|~|"(begin
      test $code -eq 0; and echo (flash_fst); or echo (flash_dim)
    end)"⌁"(flash_off)"|g" \
  | sed "s|/|"(flash_snd)" ) "(flash_off)"|g" \
  | sed "s|"$base"|"(flash_fst)$base(flash_off)"|g")(flash_snd)(begin
      if test "$PWD" = "/"
        echo ""
      else
        echo " ) "
      end
    end)(flash_off)
end
