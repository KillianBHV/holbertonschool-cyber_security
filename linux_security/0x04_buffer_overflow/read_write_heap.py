#!/usr/bin/python3
"""
Script to read from and write to the heap
"""
import sys


def get_heap_start_end(pid):
    """
    Search the heap pool of a specified process

    :param pid: Target process

    :return: Start and End addresses of the process heap
    """
    try:
        with open("/proc/{}/maps".format(pid), "r") as maps:
            for line in maps:
                if "[heap]" in line:
                    heap_range = line.split(" ")[0]
                    start_addr, end_addr = heap_range.split("-")
                    start_addr = int(start_addr, 16)
                    end_addr = int(end_addr, 16)
                    return start_addr, end_addr

        print("[ERROR] heap segment not found in file")
        sys.exit(1)
    except Exception as e:
        print("Exception handling in get_heap_start_end: {}".format(e))
        sys.exit(1)


def read_from_heap(pid, start, end):
    """
    Read the data from the heap (in the specified pool)

    :param pid: Target process
    :param start: First pool address
    :param end: Last pool address

    :return: Read data
    """
    try:
        with open("/proc/{}/mem".format(pid), "rb") as read_mem:
            read_mem.seek(start)
            return read_mem.read(end - start)
    except Exception as e:
        print("Exception handling in read_from_heap: {}".format(e))
        sys.exit(1)


def write_to_heap(pid, address, data):
    """
    Write a specified data into the heap

    :param pid: Target process
    :param address: Address to write
    :param data: Data to put into heap

    :return: Nothing
    """
    try:
        with open("/proc/{}/mem".format(pid), "rb+") as write_mem:
            write_mem.seek(address)
            write_mem.write(data)
    except Exception as e:
        print("Exception handling in write_to_heap: {}".format(e))
        sys.exit(1)


def search_replace_heap():
    """
    Search data into the heap and replace it

    :return: Nothing
    """
    if len(sys.argv) != 4:
        print('Usage: read_write_heap.py <pid> <search_str> <replace_str>')
        sys.exit(1)

    process_id = sys.argv[1]
    search_string = sys.argv[2].encode()
    replace_string = sys.argv[3].encode().ljust(len(search_string), b'\x00')

    heap_start, heap_end = get_heap_start_end(process_id)
    heap_content = read_from_heap(process_id, heap_start, heap_end)

    offset = heap_content.find(search_string)
    if offset == -1:
        print("[ERROR] Search string not found in heap")
        sys.exit(1)

    writing_address = heap_start + offset
    write_to_heap(process_id, writing_address, replace_string)


if __name__ == "__main__":
    """ Main Execution """
    search_replace_heap()
