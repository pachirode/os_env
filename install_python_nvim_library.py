import os
import subprocess

def install_virtualenv():
    try:
        subprocess.run(['pip', 'install', 'virtualenv'])
        return True
    except Exception as e:
        print("Install virtualenv failed.")
        return False


def check_virtualenv():
    try:
        import virtualenv
        return True
    except ImportError:
        return install_virtualenv()

def create_venv(venv_name):
    try:
        subprocess.check_call(['virtualenv', venv_name])
        return True
    except subprocess.CalledProcessError:
        print(f"Create virtual enviroment '{venv_name}' failed.")
        return False

def install_library(venv_name):
    requirements_file = "python_for_nvim.txt"

    try:
        activate_script = f"./{venv_name}/bin/activate" if not os.name == 'nt' else f".\{venv_name}\Scripts\\activate"
        activate_cmd = f"source {activate_script}" if not os.name == 'nt' else f"{activate_script}"
        subprocess.check_call(activate_cmd, shell=True)


        with open(requirements_file, "r") as f:
            dependencies = f.readlines()

        for dependency in dependencies:
            dependency = dependency.split(" ")[0].strip()
            try:
                command = activate_cmd + f" && pip install {dependency}"
                subprocess.check_call(command, shell=True)
            except subprocess.CalledProcessError:
                print(f"[Error] '{dependency}' install failed")
    except FileNotFoundError:
        print("python_for_nvim.txt not found.")
    except Exception as e:
        print("[Error] ", e)


if __name__=="__main__":
    venv_name = "python_for_nvim"

    if check_virtualenv() and create_venv(venv_name):
        install_library(venv_name)






