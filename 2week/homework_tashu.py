import csv
from operator import itemgetter

def get_top10_station(tashu_dict, station_dict):

    j = 0
    rent_station = []
    return_station = []
    name = []
    station_count = [0 for i in range(250)]
    station_num = [q for q in range(250)]
    result = [['' for col in range(3)] for row in range(10)]

    for rent in tashu_dict:
        rent_station.append(rent['RENT_STATION'])
        return_station.append(rent['RETURN_STATION'])

    for station in station_dict:
        name.append(station['명칭'])

    for z in rent_station:
        if rent_station[j] != '':
            if return_station[j] != '':
                station_count[int(rent_station[j])] += 1
        if return_station[j] != '':
            if rent_station[j] != '':
                station_count[int(return_station[j])] += 1
        j = j + 1

    counting_sort(station_count,station_num)

    for a in range(10):
        result[a][0] = name[station_num[a]-1]
        result[a][1] = str(station_num[a])
        result[a][2] = station_count[a]

    return result

def get_top10_trace(tashu_dict, station_dict):

    num = 0
    num2 = 0
    len_station = 228*228
    num3 = 0
    rent_station = []
    return_station = []
    name = []
    station_name = ['' for w in range(228)]
    station = [[0 for col in range(228)] for row in range(228)]
    station_result = [[0 for col in range(5)] for row in range(228*228)]
    result = [['' for col in range(5)] for row in range(10)]

    for rent in tashu_dict:
        rent_station.append(rent['RENT_STATION'])
        return_station.append(rent['RETURN_STATION'])

    for station_tashu in station_dict:
        name.append(station_tashu['명칭'])

    cnt = len(rent_station)
    cnt_name = len(name)

    for y in range(0,cnt_name):
        station_name[y+1] = name[y]

    for j in range(0,cnt):
        if rent_station[j] != '' :
            if return_station[j] != '':
                station[int(rent_station[j])][int(return_station[j])] += 1

    for j in range(len_station):
        if num2 != 228:
            string = str(num)
            string2 = str(num2)
            station_result[num3][0] = station_name[num]
            station_result[num3][1] = string
            station_result[num3][2] = station_name[num2]
            station_result[num3][3] = string2
            station_result[num3][4] = int(station[num][num2])
            num2 = num2 +1
            num3 = num3 + 1
        else :
            num = num + 1
            num2 = 0

    insert(station_result)

    for j in range(0,10):
        result[j] = station_result[j]

    return result

def counting_sort(A,B):
    for i in range(1,250):
        j = i
        temp_value = A[i]
        temp_num = B[i]
        while temp_value > A[j-1] and j > 0:
            A[j] = A[j-1]
            B[j] = B[j-1]
            j -= 1
        A[j] = temp_value
        B[j] = temp_num

    return A,B

def insert(array):
    for i in range(len(array)):
        if i > 0:
            while array[i-1][4] <= array[i][4] and i > 0:
                array[i-1], array[i] = array[i], array[i-1]
                i = i-1

    return array