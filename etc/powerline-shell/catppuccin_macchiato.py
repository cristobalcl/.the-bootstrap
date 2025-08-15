from powerline_shell.themes.default import DefaultColor

# Colores claros con predominio de azules
white = 15
light_gray = 7
gray = 8
black = 0
light_blue = 153
blue = 33
cyan = 14
teal = 37
light_teal = 122
light_green = 120
green = 2
red = 1
light_red = 203
yellow = 11
light_yellow = 229


class Color(DefaultColor):
    # Usuario y host
    USERNAME_FG = gray
    USERNAME_BG = white
    USERNAME_ROOT_BG = light_red

    HOSTNAME_FG = gray
    HOSTNAME_BG = light_gray

    # Directorio
    HOME_SPECIAL_DISPLAY = True
    HOME_BG = white
    HOME_FG = gray
    PATH_BG = gray
    PATH_FG = light_gray
    CWD_FG = white
    SEPARATOR_FG = light_gray

    # Solo lectura
    READONLY_BG = red
    READONLY_FG = white

    # Git
    REPO_CLEAN_BG = light_green
    REPO_CLEAN_FG = black
    REPO_DIRTY_BG = light_yellow
    REPO_DIRTY_FG = black

    # Procesos en background
    JOBS_FG = teal
    JOBS_BG = light_gray

    # Estado comando
    CMD_PASSED_BG = gray
    CMD_PASSED_FG = white
    CMD_FAILED_BG = red
    CMD_FAILED_FG = white

    SVN_CHANGES_BG = REPO_DIRTY_BG
    SVN_CHANGES_FG = REPO_DIRTY_FG

    # Python venv (ahora azul)
    VIRTUAL_ENV_BG = blue
    VIRTUAL_ENV_FG = white

    # AWS
    AWS_PROFILE_FG = blue
    AWS_PROFILE_BG = light_gray

    # Hora
    TIME_FG = gray
    TIME_BG = light_gray
