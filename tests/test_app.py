# tests/test_app.py
import io
import runpy
import unittest
from contextlib import redirect_stdout

from app import greet


class TestApp(unittest.TestCase):

    def test_greet(self):
        self.assertEqual(greet("World"), "Hello, World from Maya Zeaiter!")

    def test_main_prints_greeting(self):
        buffer = io.StringIO()
        with redirect_stdout(buffer):
            runpy.run_path("app.py", run_name="__main__")
        self.assertEqual(buffer.getvalue().strip(),
                         "Hello, World from Maya Zeaiter!")


if __name__ == "__main__":
    unittest.main()
