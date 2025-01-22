
C++ always truncates, aka rounds down

The size of a struct is known at compile time, so it’s value can be trivially copied.
The size of an array is not known, ever, since an array is treated as a pointer.

------------------------------------------------------------

do {...} while (..);
while (..) {...};
for (.;.;.) {...};
count << "Hello";
cint >> value;
exit(0) - выход из цикла

// Minimum and maximum macros
#define __max(a,b) (((a) > (b)) ? (a) : (b))
#define __min(a,b) (((a) < (b)) ? (a) : (b))
#define MAX(a,b) (((a) > (b)) ? (a) : (b))
#define MIN(a,b) (((a) < (b)) ? (a) : (b))

#define NOOLINE { std::cout << std::endl; }
inline void LOG(const std::string& msg) { std::cout << "LOG: -- " << msg << " --" << std::endl; }
inline void LOG(std::string_view msg) { std::cout << "LOG: -- " << msg << " --" << std::endl; }
inline void LOG(long long int num) { std::cout << "LOG: -- " << num << " --" << std::endl; }

#define EPSI  0.000001 // одна миллионная
#define MILLION 1000000
#define sqr(x)   ((x)*(x))
#define sign(x)  (((x) > 0) - ((x) < 0))

// elsewhere // extern bool debug;
bool allow_debug=1;
#ifdef MY_DEBUG
bool debug = true * allow_debug;
#else
bool debug = false;
#endif

assert(a == b && "A is not equal to B");
assert(("A must be equal to B", a==b));


std::atomic_bool liveon{ true };


std::cout << "foo @ th_" << std::this_thread::get_id() << std::endl;


int arr[5];
void foo(int (&arr)[5]) {
    arr[0] = 0;
}


std::string ZeroPadNumber(unsigned long int num, unsigned int N) {
  std::stringstream ss;
  std::string pad;
  std::string ret;
  // the number is converted to string with the help of stringstream
  ss << num;
  ss >> ret;
  // Append zero chars
  int str_length = ret.length();
  for (int i = 0; i < int(N - str_length); i++)
    pad += "0";
  return pad + ret;
}

void zero_pad_right(std::string& s, uint N) {
    uint str_length = (uint) s.length();
    if (str_length == N) { return; }
    uint missing = N - str_length;
    s.reserve(str_length+missing);
    for (int i = 0; i < missing; i++) {
        s.append("0");
    }
}


enum class Indic { idle, ok, alert };
Indic com_status = Indic::idle;

Part my_struct;
my_struct = Part(); // reset

my_struct = {}; // reset (C++11)

template <typename T>
void echo(const T& arg = nullptr) {
    if (arg) {
        std::cout<<arg<<std::endl;
    } else {
    std::cout<<std::endl;
    }
}

template <typename T>
void echo(const T& arg) {
    std::cout << "arg type is " << typeid(T).name() << std::endl;
}

void foo() {
    static bool once = [](){
        cout << "once" << endl;
        return true;
    } ();
    cout << "foo" << endl;
}
// Code within lambda function is executed only once, when the static variable is initialized to the return value of lambda function. It should be thread-safe as long as your compiler support thread-safe static initialization.

std::atomic_bool work_on{true};

typedef unsigned char uchar;
quint32 === unsigned 32bit integer

uint32_t EndianConverse(uint32_t arg) {
   return ((arg>>24)&0x000000FF) | ((arg>> 8)&0x0000FF00) |
          ((arg<< 8)&0x00FF0000) | ((arg<<24)&0xFF000000);
}

using Lgrd = std::lock_guard<std::mutex>;
Lgrd lock(some_mutex);

std::lock_guard<std::mutex> lock(m_plan_busy);
std::lock_guard lock(m_plan_busy);

using Clock = std::chrono::high_resolution_clock;
typedef std::chrono::milliseconds Msec;
typedef std::chrono::microseconds Usec;
typedef std::chrono::seconds Sec;
using durMs = std::chrono::duration<long, std::milli>;
using durUs = std::chrono::duration<long, std::micro>;
( std::chrono::duration_cast<Usec>( times[i]-ask_beg ) ).count()
auto durCastMcs = [](auto x){return std::chrono::duration_cast<std::chrono::microseconds>(x);};
auto durCastMS = [](auto x){return std::chrono::duration_cast<std::chrono::milliseconds>(x);};

auto now = std::chrono::system_clock::now();
std::chrono::duration_cast<Msec>(now.time_since_epoch()).count(); // get Unix time

const auto zero_tp = std::chrono::system_clock::time_point (std::chrono::milliseconds(0));
std::chrono::duration_cast<Msec>(now-zero_tp).count(); // get Unix time


for (auto & element : vec) {
    cout << element << " ";
}

for (iter; iter < vec.end(); iter++) {
    cout << *iter << " ";
}

for (const auto& [key, value] : myMap) {
    std::cout << key << " has value " << value << std::endl;
}

std::for_each(stdArray.begin(), stdArray.end(), [](auto x) { std::cout << x <<" "; });


for (unsigned char* p = &buf[0]; *p; ++p)
    printf("%02x ", *p);

fflush(stdin);
<<std::flush;

void reversBytesBy(uint8_t* data, int N) {
    if (N <= 0) {return;}
    int steps = std::ceil((float)def_MAX_MICBUS_IN_ETH_SIZE / N);
    // reverse every 'N' amount of bytes
    for (int i = 0; i < steps; i++) {
        for (int ii = 0; ii < N / 2; ii++) {
            int i1 = i * N + ii;
            int i2 = i * N + N - 1 - ii;
            uint8_t zeroval = 0;
            if (i1 < def_MAX_MICBUS_IN_ETH_SIZE) {
                std::swap(data[i1], i2 < def_MAX_MICBUS_IN_ETH_SIZE ? data[i2] : zeroval);
            }
        }
    }
}

uint16_t swapBytes(uint16_t in_) {
    return ((in_ & 0xff00) >> 8) | ((in_ & 0x00ff) << 8);
}


//        for (unsigned char* p = &buf[0]; *p; ++p)
//            printf("%02x ", *p);
//        printf("\nadr28 has %02x\n    or dec %d\n", buf[28]);
        int dec = buf[28]; //works!
        for (int i=0; i<33; i++) {
//            printf("%02x ", buf[i]);
        }

struct ComRecipe {
    ComRecipe(CassTask task, quint32 sft, quint32 len, QString path, quint16 repeats, quint16 timeout)
        : task(task), path(path), sft(sft), len(len), repeats(repeats), timeout(timeout)
    { };
    CassTask task;
    QString path;
    quint32 sft;
    quint32 len;
    quint16 repeats;
    quint16 timeout;
};

mas = new int[n]{0}; // new array & init to zeroes

if (debug) { static int errcnt; if ( errcnt++ % 9 == 0 ) printf("stag#somestep : something=%d\n", val); }

std::function<void(void)> cb = &foo; // more simple callback

atimer->add(std::chrono::milliseconds(1600), foo, true);
atimer->add(std::chrono::milliseconds(2000), [](){foo();}, true);
atimer->add(std::chrono::milliseconds(700), [this](){this->thing_connect();}, true);

// Measure cpu time taken
time_t start, end;
time(&start);
some_function();
time(&end);
double time_taken = (double)(end-start);
printf("time taken some_function is %f seconds\n", time_taken);

// Measure realworld time taken
struct timespec start, end;
clock_gettime(CLOCK_MONOTONIC, &start);
some_function();
clock_gettime(CLOCK_MONOTONIC, &end);
double time_taken;
time_taken = (end.tv_sec - start.tv_sec) * 1e9;
time_taken = (time_taken + (end.tv_nsec - start.tv_nsec)) * 1e-9;
printf("time taken some_function is %f seconds\n", time_taken);

nanosleep((const struct timespec[]){{0, 99000000L}}, NULL); // sleep 99 ms
usleep(99000); // sleep 99 ms, reqs unistd.h
void sleep_ms(int n) { std::this_thread::sleep_for(std::chrono::milliseconds(n)); } // reqs <chrono>

const struct timespec read_freq_ts;
read_freq_ts.tv_sec = (long) 0;
read_freq_ts.tv_nsec = (read_freq) * 10000L;

void some_function(void * some_param)
...
int *tmp = param; int val = *tmp;
...
int some_value = *((int *) some_param


// Prefer make_shared over the constructor to save memory allocations.
auto strBuf = std::make_unique<char[]>(buf_len + 1);


How do you initialize a “std::shared_ptr” in C++?
-------------
Kurt Guntheroth:
    using namespace std;
    shared_ptr<Foo>p1;           // default init to nullptr
    shared_ptr<Foo>p2 = nullptr; // init to nullptr
    shared_ptr<Foo>p3(new FOO);  // init to dynamic storage
    shared_ptr<Foo>p4 = p3;      // share with another shared_ptr
    auto p5 = make_shared<Foo>();// preferred
----
Line 6 is preferred because it allocates both the Foo instance and the shared_ptr’s reference count in the same block, which is faster.
shared_ptr uses expensive thread-safe increment and decrement to maintain its reference counts.
Before move semantics in C++11, shared_ptr was the only way to put non-copyable objects in a standard library container. This made shared_ptr relatively common, and some coding standards said every pointer should be a shared_ptr. With move semantics, non-copyable objects can be in containers, and unique_ptr can be used practically all the time. The only time shared_ptr is needed nowadays is in the rare event that the lifetimes of two pointers overlap unpredictably.


#pragma pack(push, 1)
struct TNet_Mfi2Din_Bsk : public RpkbGlobalHeader
{
	struct // данные (xxx байта)
	{
		RpkbDataFrameHeader headerBsk;
		unsigned int word_mfi_bsk[sizeMfiBsk];
	} data;
	//unsigned char reserve[24]; // дополнение данных до 300 байт
};
#pragma pack(pop)

int circCounter;    // Круговой счётчик исправности РУ (обновление каждый раз при обновлении буфера обмена РУ.
                    // если нет обновления 10 тактов -> ОТКАЗ



class MySingleton {
public:
  static MySingleton& Instance()
  {
    static MySingleton singleton;
    return singleton;
  }
// Other non-static member functions
private:
  MySingleton() {}                                 // Private constructor
  ~MySingleton() {}
  MySingleton(const MySingleton&) = delete;                 // Prevent copy-construction
  MySingleton& operator=(const MySingleton&) = delete;      // Prevent assignment
};


int permaAssert(bool statement, const char* comment) {
    if (statement) return 0;
    std::cout << "Release-Assertion failed: " << comment << "\n";
#if NDEBUG
    exit(1);
#else
    // if in Debug mode, do normal assert so user can shoot debugger
    assert(0);
#endif
}

int* dyn_array = (int*)malloc(100*sizeof(int));
free(dyn_array);
dyn_array[5] = 0; // clang warning
                  //
std::vector<int> vv {1,2,3,4,5};
vv[1] = 0;

int arr[10] = {};
arr[1] = 0;

std::array<int,10> cpparr{};
cpparr[1] = 0;


#include <iostream>
#include <string>
template <typename T> class Counter {
public:
    Counter() {
        std::cout << ++x;
    }
    static int x;
};
template <typename T> int Counter<T>::x;
int main() {
    Counter<int> a;
    Counter<double> b;
    Counter<Counter<double>> c;
    Counter<std::string> d;
    return 0;
}

#include <iostream>
using namespace std;
class ExceptionA {
public:
    ExceptionA(int code) : codeA(code) { };
    int codeA;
};
class ExceptionB : public ExceptionA {
public:
    ExceptionB(int code) : codeB(code), ExceptionA(1) { };
    int codeB;
};
int main() {
    try {
        throw(ExceptionB(2));
    }
    catch(ExceptionA e) {
        cout << "Exception A: " << e.codeA << endl;
    }
    catch(ExceptionB e) {
        cout << "Exception B: " << e.codeB << endl;
    }
    catch(...) {
        cout << "Exception" << endl;
    }
    return 0;
}

#include <random>
float getRandomFloat(float min = 1.0, float max = 3.0) {
    std::random_device rd;  // Источник энтропии
    std::mt19937 gen(rd()); // Генератор случайных чисел
    std::uniform_real_distribution<float> dis(min, max); // Равномерное распределение
    return dis(gen); // Генерация случайного числа
}

#include <filesystem>
std::cout << "Current path is " << std::filesystem::current_path() << '\n';

// read text from file
std::ifstream ifs("../../resources/response_255.json");
std::stringstream ss;
ss << ifs.rdbuf();
std::string s = ss.str();

inline void strip_newline(std::string& s) {
    if (!s.empty() && s[s.length()-1] == '\n') {
        s.erase(s.length()-1);
    }
}


